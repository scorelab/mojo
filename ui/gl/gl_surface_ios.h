// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "ui/gl/gl_surface.h"

namespace gfx {

class GL_EXPORT GLSurfaceIOS : public GLSurface {
 public:
  GLSurfaceIOS(gfx::AcceleratedWidget widget);

  bool SwapBuffers() override;
  void Destroy() override;
  bool IsOffscreen() override;
  gfx::Size GetSize() override;
  void* GetHandle() override;
  bool OnMakeCurrent(GLContext* context) override;

 private:
  gfx::AcceleratedWidget widget_;
  uint32_t framebuffer_;
  uint32_t colorbuffer_;
  Size last_configured_size_;
  bool framebuffer_setup_complete_;
  void SetupFramebufferIfNecessary();

  DISALLOW_COPY_AND_ASSIGN(GLSurfaceIOS);
};

}  // namespace gfx