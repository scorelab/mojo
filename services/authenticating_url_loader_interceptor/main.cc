// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "mojo/public/c/system/main.h"
#include "mojo/public/cpp/application/run_application.h"
#include "services/authenticating_url_loader_interceptor/authenticating_url_loader_interceptor_app.h"

MojoResult MojoMain(MojoHandle application_request) {
  mojo::AuthenticatingURLLoaderInterceptorApp app;
  return mojo::RunMainApplication(application_request, &app);
}
