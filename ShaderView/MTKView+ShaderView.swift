//
//  MTKView+ShaderView.swift
//  ShaderView
//
//  Created by Haga Masaki on 25/10/2017.
//  Copyright © 2017 Haga Masaki. All rights reserved.
//

import Foundation
import MetalKit

public extension SVExtension where Base: MTKView {
    public func set(renderer: ShaderViewRenderer) {
        base.framebufferOnly = false
        base.drawableSize = base.frame.size
        base.delegate = renderer
    }
}
