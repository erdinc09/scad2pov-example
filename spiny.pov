#macro sphereGlass()
	sphere {
		<0,0,0>,3.0 
	}		
#end
#macro cylinderTemplateZ()
	cone { 
		<0,0,0>,1.5
		<0,0,5.0>,0.0
	}
#end
#macro cylinderTemplateX()
	object {
		cone { 
			<0,0,0>,1.5
			<0,0,5.0>,0.0
		}
		rotate <0.0,90.0,0.0>
	}
#end
#macro cylinderTemplateY()
	object {
		cone { 
			<0,0,0>,1.5
			<0,0,5.0>,0.0
		}
		rotate <-90.0,0.0,0.0>
	}
#end
#macro spinyBall()
	merge { 
		sphere {
			<0,0,0>,3.0 
		}		
		spinesZ()
		spinesX()
		spinesY()
	}
#end
#macro spinesY()
	merge { 
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,0.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,45.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,90.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,135.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,180.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,225.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,270.0>
		}
		object {
			cylinderTemplateY()
			rotate <0.0,0.0,315.0>
		}
	}
#end
#macro spinesX()
	merge { 
		object {
			cylinderTemplateX()
			rotate <0.0,0.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,45.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,90.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,135.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,180.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,225.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,270.0,0.0>
		}
		object {
			cylinderTemplateX()
			rotate <0.0,315.0,0.0>
		}
	}
#end
#macro spinesZ()
	merge { 
		object {
			cylinderTemplateZ()
			rotate <0.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <45.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <90.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <135.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <180.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <225.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <270.0,0.0,0.0>
		}
		object {
			cylinderTemplateZ()
			rotate <315.0,0.0,0.0>
		}
	}
#end
#macro
    openscad_camera_angle(w ,h) (11*pow(w/h,0.5))
#end // OpenSCAD camera angle is dependent on view port aspect ratio. Formula is an estimation"

#macro 
	scad_camera(openscad_vpt, openscad_vpr, openscad_vpd, openscad_vpw, openscad_vph)
	camera {
	    orthographic
	    location <0,0,openscad_vpd>
	    right <-openscad_vpw/openscad_vph,0,0>
	    angle openscad_camera_angle(openscad_vpw,openscad_vph)
	    up    <0,1.33,0>
	    rotate openscad_vpr
	    translate openscad_vpt
	    look_at <0,0,0>
	}
#end
#macro 
	scad_light_source(openscad_vpt, openscad_vpr, openscad_vpd)
	light_source {
		<-1,1,1>*openscad_vpd color rgb <1,1,1> 
		rotate openscad_vpr 
		translate openscad_vpt 
	} 
	light_source {
		<1,-1,-1>*openscad_vpd color rgb <1,1,1> 
		rotate openscad_vpr 
		translate openscad_vpt 
	} 
#end
#macro scad_background()
    #include "coordinates.pov"
    #declare openscad_cornfield = color rgb <1,1,0.898039>;
    #declare openscad_metalic = color rgb <0.666667,0.666667,1>;
    #declare openscad_sunset = color rgb <0.666667,0.266667,0.266667>;
    background { openscad_cornfield } 
    #default { texture { pigment { rgb <1,1,0> } finish { ambient 0.15 diffuse 0.85 }  }  } 
#end
/*


************ spiny_test.ini ************
Width=1600
Height=1200
Input_File_Name="spiny_test.pov"
Antialias=On
Antialias_Threshold=0.1
Display=On


************ spiny_test.sh ************
povray  -L${POVRAY_SCAD_LIB} spiny_test.ini



*/
#macro scad_axes(axe_length)
    object { 
        AxisXYZ( axe_length, axe_length, axe_length, Tex_Dark, Tex_White)
    }
#end
