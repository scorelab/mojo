// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "mojo/public/c/system/main.h"
#include "mojo/public/cpp/application/run_application.h"
#include "services/files/files_app.h"

MojoResult MojoMain(MojoHandle application_request) {
  mojo::files::FilesApp files_app;
  return mojo::RunMainApplication(application_request, &files_app);
}
