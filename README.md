# ShaderView
A library for simple shader programming

<p align="center">
  <img src="https://github.com/hagmas/ShaderView/blob/master/Images/PlaygroundExample.gif" alt="A ShaderView example with Playground"/>
</p>

## About ShaderView
ShaderView is designed to extend `MTKView` which enables to do shader view programming much simpler and easier, like [GLSL Sandbox](http://glslsandbox.com) or [Shadertoy](https://www.shadertoy.com). This library wraps the configuration process of `MTLLibrary`, `MTLFunction`, `MTLComputePipelineState`, `MTLCommandQueue`, `MTLCommandBuffer` and `MTLCommandEncoder`, and takes a simple kernel function with the arguments of output texture, current time, touch events and the position in the grid.

## Usage
ShaderView is consisted mainly from `ShaderViewRenderer` and `MTKView`'s extension. 

