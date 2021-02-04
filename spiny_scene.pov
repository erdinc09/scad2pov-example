#version  3.7;

#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "spiny.pov"  // generated file
#include "coordinates.pov"
#include "glass.inc"


global_settings { 
    assumed_gamma 1
}

camera { 
    orthographic
    location <1, 5, -6>
    up    <0,1.33,0>
    right  <1,0,0>
    look_at <0,0,-0.8>
    angle 35
}


light_source { 
    <200, 250, 0>
    , 1 area_light z*60, y*60, 12, 12 adaptive 0
}


object { 
    spinyBall()
    texture { T_Ruby_Glass } 
    interior { I_Glass4 } 
    
    scale 0.25
    translate <0.5,1,-3>
}


plane
{ 
    y, 0
    
    pigment
    { 
        wood color_map { 
            [0 rgb <.9,.7,.3>]
            [1 rgb <.8,.5,.2>]
        }
        turbulence .5
        scale <1, 1, 20>*.2
    }
    
    finish { specular 1 } 
    
    
    normal
    { 
        gradient x 1
        slope_map
        { 
            [0 <0, 1>] // 0 height, strong slope up
            [.05 <1, 0>] // maximum height, horizontal
            [.95 <1, 0>] // maximum height, horizontal
            [1 <0, -1>] // 0 height, strong slope down
        }
    }
}


