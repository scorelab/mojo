// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <map>

#include "base/logging.h"
#include "services/media/framework/safe_clone.h"
#include "services/media/framework_ffmpeg/av_codec_context.h"
#include "services/media/framework_ffmpeg/av_format_context.h"
#include "services/media/framework_ffmpeg/av_io_context.h"
#include "services/media/framework_ffmpeg/av_packet.h"
#include "services/media/framework_ffmpeg/ffmpeg_demux.h"

namespace mojo {
namespace media {

class FfmpegDemuxImpl : public FfmpegDemux {
 public:
  FfmpegDemuxImpl();

  ~FfmpegDemuxImpl() override;

  // Demux implementation.
  Result Init(std::shared_ptr<Reader> reader) override;

  std::unique_ptr<Metadata> metadata() const override;

  const std::vector<DemuxStream*>& streams() const override;

  void Seek(int64_t position) override;

  // MultistreamSource implementation.
  size_t stream_count() const override;

  PacketPtr PullPacket(size_t* stream_index_out) override;

 private:
  class FfmpegDemuxStream : public DemuxStream {
   public:
    FfmpegDemuxStream(const AVFormatContext& format_context, size_t index);

    ~FfmpegDemuxStream() override;

    // Demux::DemuxStream implementation.
    size_t index() const override;

    std::unique_ptr<StreamType> stream_type() const override;

   private:
    AVStream* stream_;
    size_t index_;
    std::unique_ptr<StreamType> stream_type_;
  };

  // Specialized packet implementation.
  class DemuxPacket : public Packet {
   public:
    static PacketPtr Create(ffmpeg::AvPacketPtr av_packet) {
      return PacketPtr(new DemuxPacket(std::move(av_packet)));
    }

    AVPacket& av_packet() {
      return *av_packet_;
    }

   protected:
    ~DemuxPacket() override {}

    void Release() override { delete this; }

   private:
    DemuxPacket(ffmpeg::AvPacketPtr av_packet) :
        Packet(
            (av_packet->pts == AV_NOPTS_VALUE) ? kUnknownPts : av_packet->pts,
            false,
            static_cast<size_t>(av_packet->size),
            av_packet->data),
        av_packet_(std::move(av_packet)) {
      DCHECK(av_packet_->size >= 0);
    }

    ffmpeg::AvPacketPtr av_packet_;
  };

  struct AVFormatContextDeleter {
    inline void operator()(AVFormatContext* ptr) const {
      avformat_free_context(ptr);
    }
  };

  // Produces an end-of-stream packet for next_stream_to_end_.
  PacketPtr PullEndOfStreamPacket(size_t* stream_index_out);

  // Copies metadata from the specified source into map.
  void CopyMetadata(
      AVDictionary* source,
      std::map<std::string, std::string>& map);

  std::shared_ptr<Reader> reader_;
  AvFormatContextPtr format_context_;
  AvIoContextPtr io_context_;
  std::vector<DemuxStream*> streams_;
  std::unique_ptr<Metadata> metadata_;
  int64_t next_pts_;
  int next_stream_to_end_ = -1; // -1: don't end, streams_.size(): stop.
};

// static
std::shared_ptr<Demux> FfmpegDemux::Create() {
  return std::shared_ptr<Demux>(new FfmpegDemuxImpl());
}

FfmpegDemuxImpl::FfmpegDemuxImpl() {}

FfmpegDemuxImpl::~FfmpegDemuxImpl() {}

Result FfmpegDemuxImpl::Init(std::shared_ptr<Reader> reader) {
  static constexpr uint64_t kNanosecondsPerMicrosecond = 1000;

  reader_ = reader;

  io_context_ = AvIoContext::Create(reader);
  if (!io_context_) {
    LOG(ERROR) << "AvIoContext::Create failed";
    return Result::kInternalError;
  }

  format_context_ = AvFormatContext::OpenInput(io_context_);
  if (!format_context_) {
    LOG(ERROR) << "AvFormatContext::OpenInput failed";
    return Result::kInternalError;
  }

  // TODO(dalesat): This synchronous operation may take a long time.
  int r = avformat_find_stream_info(format_context_.get(), nullptr);
  if (r < 0) {
    LOG(ERROR) << "avformat_find_stream_info failed, result " << r;
    return Result::kInternalError;
  }

  std::map<std::string, std::string> metadata_map;

  CopyMetadata(format_context_->metadata, metadata_map);
  for (uint i = 0; i < format_context_->nb_streams; i++) {
    streams_.push_back(new FfmpegDemuxStream(*format_context_, i));
    CopyMetadata(format_context_->streams[i]->metadata, metadata_map);
  }

  metadata_ = Metadata::Create(
      format_context_->duration * kNanosecondsPerMicrosecond,
      metadata_map["TITLE"],
      metadata_map["ARTIST"],
      metadata_map["ALBUM"],
      metadata_map["PUBLISHER"],
      metadata_map["GENRE"],
      metadata_map["COMPOSER"]);

  return Result::kOk;
}

std::unique_ptr<Metadata> FfmpegDemuxImpl::metadata() const {
  return SafeClone(metadata_);
}

const std::vector<Demux::DemuxStream*>& FfmpegDemuxImpl::streams() const {
  return streams_;
}

void FfmpegDemuxImpl::Seek(int64_t position) {
  int r = av_seek_frame(format_context_.get(), -1, position / 1000, 0);
  if (r < 0) {
    LOG(WARNING) << "av_seek_frame failed, result " << r;
  }
  next_stream_to_end_ = -1;
}

size_t FfmpegDemuxImpl::stream_count() const {
  if (!format_context_) {
    return 0;
  }
  return format_context_->nb_streams;
}

PacketPtr FfmpegDemuxImpl::PullPacket(size_t* stream_index_out) {
  DCHECK(stream_index_out);

  if (next_stream_to_end_ != -1) {
    // We're producing end-of-stream packets for all the streams.
    return PullEndOfStreamPacket(stream_index_out);
  }

  ffmpeg::AvPacketPtr av_packet = ffmpeg::AvPacket::Create();

  av_packet->data = nullptr;
  av_packet->size = 0;

  if (av_read_frame(format_context_.get(), av_packet.get()) < 0) {
    // End of stream. Start producing end-of-stream packets for all the streams.
    next_stream_to_end_ = 0;
    return PullEndOfStreamPacket(stream_index_out);
  }

  *stream_index_out =
      static_cast<size_t>(av_packet->stream_index);
  // TODO(dalesat): What if the packet has no PTS or duration?
  next_pts_ = av_packet->pts + av_packet->duration;

  return DemuxPacket::Create(std::move(av_packet));
}

PacketPtr FfmpegDemuxImpl::PullEndOfStreamPacket(size_t* stream_index_out) {
  DCHECK(next_stream_to_end_ >= 0);

  if (static_cast<std::size_t>(next_stream_to_end_) >= streams_.size()) {
    NOTREACHED() << "PullPacket called after all streams have ended";
    return nullptr;
  }

  *stream_index_out = next_stream_to_end_++;
  return Packet::CreateEndOfStream(next_pts_);
}

void FfmpegDemuxImpl::CopyMetadata(
    AVDictionary* source,
    std::map<std::string, std::string>& map) {
  if (source == nullptr) {
    return;
  }

  for (AVDictionaryEntry *entry =
      av_dict_get(source, "", nullptr, AV_DICT_IGNORE_SUFFIX);
      entry != nullptr;
      entry = av_dict_get(source, "", entry, AV_DICT_IGNORE_SUFFIX)) {
    if (map.find(entry->key) == map.end()) {
      map.emplace(entry->key, entry->value);
    }
  }
}

FfmpegDemuxImpl::FfmpegDemuxStream::FfmpegDemuxStream(
    const AVFormatContext& format_context,
    size_t index) :
    stream_(format_context.streams[index]), index_(index) {
  stream_type_ = AvCodecContext::GetStreamType(*stream_->codec);
}

FfmpegDemuxImpl::FfmpegDemuxStream::~FfmpegDemuxStream() {}

size_t FfmpegDemuxImpl::FfmpegDemuxStream::index() const {
  return index_;
}

std::unique_ptr<StreamType> FfmpegDemuxImpl::FfmpegDemuxStream::stream_type()
    const {
  return SafeClone(stream_type_);
}

} // namespace media
} // namespace mojo
