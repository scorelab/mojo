// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <cstdio>

#include "base/files/file_util.h"
#include "services/media/framework/parts/file_reader.h"
#include "url/gurl.h"

namespace mojo {
namespace media {

FileReader::~FileReader() {
  if (file_ != nullptr) {
    fclose(file_);
    file_ = nullptr;
  }
}

Result FileReader::Init(const GURL& gurl) {
  // TODO(dalesat): Assumes the authority is localhost.
  std::string path = gurl.path();
  file_ = base::OpenFile(base::FilePath(path), "rb");
  if (file_ == nullptr) {
    return Result::kNotFound;
  }

  if (fseek(file_, 0, SEEK_END) == 0) {
    size_ = ftell(file_);
    if (fseek(file_, 0, SEEK_SET) < 0) {
      fclose(file_);
      file_ = nullptr;
      return Result::kUnsupportedOperation;
    }
  } else {
    size_ = kFailed;
  }

  return Result::kOk;
}

size_t FileReader::Read(uint8_t* buffer, size_t bytes_to_read) {
  size_t bytes_read = fread(buffer, 1, bytes_to_read, file_);
  if (bytes_read != bytes_to_read && ferror(file_) != 0) {
    bytes_read = kFailed;
  }
  return bytes_read;
}

int64_t FileReader::GetPosition() const {
  return ftell(file_);
}

int64_t FileReader::SetPosition(int64_t position) {
  if (fseek(file_, position, SEEK_SET) < 0) {
    return -1;
  }
  return position;
}

size_t FileReader::GetSize() const {
  return size_;
}

bool FileReader::CanSeek() const {
  return true;
}

} // namespace media
} // namespace mojo
