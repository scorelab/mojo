// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <deque>
#include <iomanip>
#include <iostream>

#include "base/bind.h"
#include "examples/media_test/keystroke.h"
#include "examples/media_test/media_test.h"
#include "mojo/application/application_runner_chromium.h"
#include "mojo/public/c/system/main.h"
#include "mojo/public/cpp/application/application_connection.h"
#include "mojo/public/cpp/application/application_delegate.h"
#include "mojo/public/cpp/application/application_impl.h"

namespace mojo {
namespace media {
namespace examples {

class MediaTestApp : public mojo::ApplicationDelegate {
 public:
  MediaTestApp() {}

  ~MediaTestApp() override {}

  // ApplicationDelegate implementation.
  void Initialize(mojo::ApplicationImpl* app) override {
    app_ = app;
    ProcessArgs(app->args());

    std::cout << std::endl << "MEDIA TEST" << std::endl << std::endl;

    if (input_file_names_.empty()) {
      std::cout << "Please provide the names of the files you want to play;"
                << " for example:" << std::endl;
      std::cout << "mojo/devtools/common/mojo_run \\" << std::endl;
      std::cout << "    \"https://core.mojoapps.io/media_test.mojo \\"
                << std::endl;
      std::cout << "    file:///usr/local/google/home/you/superstition.ogg \\"
                << std::endl;
      std::cout << "    file:///usr/local/google/home/you/higherground.ogg\""
                << std::endl
                << std::endl;
      base::MessageLoop::current()->Quit();
      return;
    }

    std::cout << "    <enter>         play/pause" << std::endl;
    std::cout << "    n<enter>        next file" << std::endl;
    std::cout << "    p<enter>        previous file" << std::endl;
    std::cout << "    <digit><enter>  seek (0% - 90%)" << std::endl;
    std::cout << "    q<enter>        quit" << std::endl << std::endl;

    if (paint_) {
      std::cout << "    duration   <none>" << std::endl;
      std::cout << "    title      <none>" << std::endl;
      std::cout << "    artist     <none>" << std::endl;
      std::cout << "    album      <none>" << std::endl;
      std::cout << "    publisher  <none>" << std::endl;
      std::cout << "    genre      <none>" << std::endl;
      std::cout << "    composer   <none>" << std::endl << std::endl;
      std::cout << std::endl << std::endl << kUp << std::flush;
    } else {
      std::cout << std::endl;
    }

    CreateNewMediaTest();
    Poll();
  }

  bool ConfigureIncomingConnection(
      mojo::ApplicationConnection* connection) override {
    return true;
  }

 private:
  static const char* kHome;
  static const char* kClearLine;
  static const char* kUp;
  static constexpr double ns_per_second = 1000000000.0;

  // Processes arguments.
  void ProcessArgs(const std::vector<std::string>& args) {
    for (size_t i = 1; i < args.size(); ++i) {
      const std::string& arg = args[i];
      if (arg == "--paint") {
        paint_ = true;
      } else if (arg == "--no-paint") {
        paint_ = false;
      } else {
        input_file_names_.push_back(arg);
      }
    }

    input_file_names_iter_ = input_file_names_.begin();
  }

  // Creates a new MediaTest object to play the file referenced by
  // input_file_names_iter_.
  void CreateNewMediaTest() {
    MOJO_DCHECK(input_file_names_iter_ != input_file_names_.end());
    media_test_ = MediaTest::Create(app_, *input_file_names_iter_);

    metadata_shown_ = false;
    media_test_->RegisterUpdateCallback(
        [this]() { HandleMediaTestUpdateCallback(); });

    media_test_->Play();
  }

  void HandleMediaTestUpdateCallback() {
    if (media_test_->state() == MediaState::ENDED) {
      // MediaTest doesn't appreciate being deleted in this callback.
      // Next time Poll runs, we move on to the next file.
      base::MessageLoop::current()->PostTask(
          FROM_HERE,
          base::Bind(&MediaTestApp::PlayNext, base::Unretained(this)));
    }

    const MediaMetadataPtr& metadata = media_test_->metadata();

    if (metadata) {
      duration_ns_ = metadata->duration;
    }

    if (paint_) {
      // Move the cursor up the terminal so we paint over the old metadata
      // (7 lines) a blank line and the state line (total of 9 lines).
      std::cout << kHome << kUp << kUp << kUp << kUp << kUp << kUp << kUp << kUp
                << kUp;
    }

    if (!paint_ && metadata_shown_) {
      // Do nothing.
    } else if (metadata) {
      metadata_shown_ = true;
      std::cout << "    duration   " << std::setprecision(1)
                << double(metadata->duration) / ns_per_second << " seconds"
                << clear_line() << std::endl;
      std::cout << "    title      "
                << (metadata->title ? metadata->title : "<none>")
                << clear_line() << std::endl;
      std::cout << "    artist     "
                << (metadata->artist ? metadata->artist : "<none>")
                << clear_line() << std::endl;
      std::cout << "    album      "
                << (metadata->album ? metadata->album : "<none>")
                << clear_line() << std::endl;
      std::cout << "    publisher  "
                << (metadata->publisher ? metadata->publisher : "<none>")
                << clear_line() << std::endl;
      std::cout << "    genre      "
                << (metadata->genre ? metadata->genre : "<none>")
                << clear_line() << std::endl;
      std::cout << "    composer   "
                << (metadata->composer ? metadata->composer : "<none>")
                << clear_line() << std::endl
                << std::endl;
    } else {
      std::cout << "    duration   <none>" << kClearLine << std::endl;
      std::cout << "    title      <none>" << kClearLine << std::endl;
      std::cout << "    artist     <none>" << kClearLine << std::endl;
      std::cout << "    album      <none>" << kClearLine << std::endl;
      std::cout << "    publisher  <none>" << kClearLine << std::endl;
      std::cout << "    genre      <none>" << kClearLine << std::endl;
      std::cout << "    composer   <none>" << kClearLine << std::endl;
      std::cout << std::endl;
    }
    std::cout << "    " << state_string() << clear_line() << std::endl;
  }

  // Returns a string describing the MediaTest object's state.
  const char* state_string() const {
    switch (media_test_->state()) {
      case MediaState::FAULT:
        return "FAULT";
      case MediaState::UNPREPARED:
        return "unprepared";
      case MediaState::PAUSED:
        return "paused";
      case MediaState::PLAYING:
        return "playing";
      case MediaState::ENDED:
        return "ended";
    }
    return "UNSUPPORTED STATE VALUE";
  }

  // Handles a keystroke.
  void HandleKeystroke(char keystroke) {
    switch (keystroke) {
      case '\n':
        TogglePlayPause();
        break;
      case 'q':
        base::MessageLoop::current()->Quit();
        quit_ = true;
        if (paint_) {
          std::cout << kHome << kUp << "    quitting" << kClearLine << std::endl
                    << kClearLine << std::endl;
        } else {
          std::cout << "    quitting" << std::endl;
        }
        break;
      case 'n':
        if (++input_file_names_iter_ == input_file_names_.end()) {
          input_file_names_iter_ = input_file_names_.begin();
        }
        CreateNewMediaTest();
        break;
      case 'p':
        if (input_file_names_iter_ == input_file_names_.begin()) {
          input_file_names_iter_ = input_file_names_.end();
        }
        input_file_names_iter_--;
        CreateNewMediaTest();
        break;
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9': {
        int64_t position_ns = ((keystroke - '0') / 10.0) * duration_ns_;
        media_test_->Seek(position_ns);
        if (!paint_) {
          std::cout << "    seeking to " << std::fixed << std::setprecision(1)
                    << double(position_ns) / ns_per_second << " seconds  "
                    << std::endl;
        }
        break;
      }
    }
  }

  // Toggles between play and pause (prepared) states.
  void TogglePlayPause() {
    switch (media_test_->state()) {
      case MediaState::PAUSED:
        media_test_->Play();
        break;
      case MediaState::PLAYING:
        media_test_->Pause();
        break;
      case MediaState::ENDED:
        if (input_file_names_.size() == 1) {
          // Replaying the only file. Reuse the same MediaTest instance.
          media_test_->Seek(0);
          media_test_->Play();
        } else {
          // Starting a new file. Create a new MediaTest instance.
          CreateNewMediaTest();
        }
        break;
      default:
        break;
    }
  }

  // Does any needed work and schedules itself to run again soon. Quits when
  // quit_ is true.
  void Poll() {
    MOJO_DCHECK(!quit_);

    char keystroke = Keystroke();
    if (keystroke != 0) {
      HandleKeystroke(keystroke);
    }

    if (quit_) {
      // Eat the any additional keystrokes, which would otherwise make it to the
      // command shell.
      while (Keystroke() != 0) {
        // Do nothing.
      }
      return;
    }

    if (paint_) {
      std::cout << kHome << "    " << std::fixed << std::setprecision(1)
                << double(media_test_->position_ns()) / ns_per_second
                << " seconds  " << kClearLine << std::flush;
    }

    base::MessageLoop::current()->PostDelayedTask(
        FROM_HERE, base::Bind(&MediaTestApp::Poll, base::Unretained(this)),
        base::TimeDelta::FromMilliseconds(100));
  }

  void PlayNext() {
    if (++input_file_names_iter_ == input_file_names_.end()) {
      input_file_names_iter_ = input_file_names_.begin();
    } else {
      CreateNewMediaTest();
    }
  }

  const char* clear_line() const { return paint_ ? kClearLine : ""; }

  mojo::ApplicationImpl* app_;
  std::unique_ptr<MediaTest> media_test_;
  std::deque<std::string> input_file_names_;
  decltype(input_file_names_.begin()) input_file_names_iter_;
  bool quit_ = false;
  bool paint_ = true;
  bool metadata_shown_ = false;
  uint64_t duration_ns_;

  DISALLOW_COPY_AND_ASSIGN(MediaTestApp);
};

const char* MediaTestApp::kHome = "\r";
const char* MediaTestApp::kClearLine = "\033[K";
const char* MediaTestApp::kUp = "\033[A";

}  // namespace examples
}  // namespace media
}  // namespace mojo

MojoResult MojoMain(MojoHandle application_request) {
  mojo::ApplicationRunnerChromium runner(
      new mojo::media::examples::MediaTestApp);
  return runner.Run(application_request);
}
