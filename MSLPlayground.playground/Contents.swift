//: Playground - noun: a place where people can play

import Foundation
import AppKit
import MetalKit
import ShaderView
import PlaygroundSupport

let device = MTLCreateSystemDefaultDevice()!

var library: MTLLibrary?
do {
    let path = Bundle.main.path(forResource: "MSLPlayground", ofType: "metal")
    let source = try String(contentsOfFile: path!, encoding: .utf8)
    library = try device.makeLibrary(source: source, options: nil)
} catch let error as NSError {
    print("library error: " + error.description)
}

let shaderView = MTKView(frame: NSRect(x: 0, y: 0, width: 400, height: 400), device: device)
let renderer = ShaderViewRenderer(device: device)
renderer.library = library
renderer.functionName = "playgroundSample"
shaderView.sv.set(renderer: renderer)

let view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))
view.wantsLayer = true
view.layer?.backgroundColor = CGColor.white

PlaygroundPage.current.liveView = shaderView
