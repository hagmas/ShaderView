//
//  MSLPlayground.metal
//  MSLPlayground
//
//  Created by Haga Masaki on 24/10/2017.
//  Copyright © 2017 Haga Masaki. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

float2 mod(float2 x, float y) {
    return float2(x.x - y * floor(x.x/y), x.y - y * floor(x.y/y));
}

kernel void playgroundSample(texture2d<float, access::write> o[[texture(0)]],
                             constant float &time [[buffer(0)]],
                             constant float2 *touchEvent [[buffer(1)]],
                             constant int &numberOfTouches [[buffer(2)]],
                             ushort2 gid [[thread_position_in_grid]]) {
    int width = o.get_width();
    int height = o.get_height();
    uint2 res = uint2(width, height);
    
    float3 c;
    float l, z = time;
    for(int i = 0; i<4; i++) {
        float2 uv, p = float2(gid) / float2(width, height);
        uv = p;
        p -= 0.5;
        p.x *= res.x/res.y;
        z += 0.07;
        l = length(p);
        uv+=p/l*(sin(z)+1.)*abs(sin(l*9.-z*2.));
        c[i]=.01/length(abs(mod(uv,1.)-.5));
    }
    o.write(float4(c/l,time), gid);
}
