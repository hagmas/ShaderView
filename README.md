# ShaderView
A library for simple shader programming.

<p align="center">
  <img src="https://github.com/hagmas/ShaderView/blob/master/Images/PlaygroundExample.gif" alt="A ShaderView example with Playground"/>
</p>


## About ShaderView
### ShaderView wraps the MTKView setup.
ShaderView is designed to extend `MTKView` which enables to do shader view programming simpler and easier, like [GLSL Sandbox](http://glslsandbox.com) or [Shadertoy](https://www.shadertoy.com). This library wraps the configuration process of `MTLLibrary`, `MTLFunction`, `MTLComputePipelineState`, `MTLCommandQueue`, `MTLCommandBuffer` and `MTLCommandEncoder`, and takes a simple kernel function with the arguments of output texture, current time, touch events and the position in the grid. Create `ShderViewRenderer`, set it on `MTLView` and add the MTLView to other UIKit view.
### Test with Playground.
The screen recorded above is a playground attacked to this workspace MSLPlayground on which you can write/test simple MSLs. The shader function in the screenshot is converted from the GLSL on [Shadertoy](https://www.shadertoy.com/view/XsXXDn).

## Usage
ShaderView is consisted mainly from `ShaderViewRenderer` and `MTKView`'s extension. 

```swift
import MetalKit
import ShaderView

// Create MTLDevice. MTLDevice is encouranged to create right after the app launch and retain throughout the life time of the app.
guard let device = MTLCreateSystemDefaultDevice else {
    return
}

// Optional: Create MTLLibrary. This is optional and if you don't set your own MTLLibrary, ShaderViewRenderer will generate a default library from the device.
var library: MTLLibrary?
do {
    let path = Bundle.main.path(forResource: "MSLPlayground", ofType: "metal")
    let source = try String(contentsOfFile: path!, encoding: .utf8)
    library = try device.makeLibrary(source: source, options: nil)
} catch let error as NSError {
    print("library error: " + error.description)
}

// Create MTLView
let shaderView = MTKView(frame: NSRect(x: 0, y: 0, width: 400, height: 400), device: device)

// Create ShaderViewRenderer with the device you created.
let renderer = ShaderViewRenderer(device: device)

// Optional: Set MTLLibrary to ShaderViewRenderer
renderer.library = library

// Set the kernel function name to ShaderViewRenderer. The function you specified must have the same arguments as "MSLPlayground.metal" in the example Playground.
renderer.functionName = "playgroundSample"

// Set the renderer to the metal view.
shaderView.sv.set(renderer: renderer)
```

## Requirements
* Xcode 9.1
* Swift 4.0.2
