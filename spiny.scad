use <scadpov.scad>;


module sphereGlass(){
	sphere(r = 3, $fn = 50);
}


module cylinderTemplateZ(){
	cylinder(d1=3,d2=0,$fn=30,h=5);
}

module cylinderTemplateX(){
	rotate([0, 90, 0])
	{
		cylinder(d1=3,d2=0,$fn=30,h=5);
	}
}

module cylinderTemplateY(){
	rotate([-90, 0, 0])
	{
		cylinder(d1=3,d2=0,$fn=30,h=5);
	}
}

module spinyBall(){
	union(){
		sphere(r = 3, $fn = 50);
		spinesZ();
		spinesX();
		spinesY();
	}
}

module spinesY(){
	union(){
		rotate([0, 0, 0])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 45])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 90])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 135])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 180])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 225])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 270])
		{
			cylinderTemplateY();
		}
		rotate([0, 0, 315])
		{
			cylinderTemplateY();
		}
	}
}

module spinesX(){
	union(){
		rotate([0, 0, 0])
		{
			cylinderTemplateX();
		}

		rotate([0, 45, 0])
		{
			cylinderTemplateX();
		}
		rotate([0, 90, 0])
		{
			cylinderTemplateX();
		}
		rotate([0, 135, 0])
		{
			cylinderTemplateX();
		}
		rotate([0, 180, 0])
		{
			cylinderTemplateX();
		}
		rotate([0, 225, 0])
		{
			cylinderTemplateX();
		}
		rotate([0, 270, 0])
		{
			cylinderTemplateX();
		}
		rotate([0, 315, 0])
		{
			cylinderTemplateX();
		}
	}
}

module spinesZ(){
	union(){
		rotate([0, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([45, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([90, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([135, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([180, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([225, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([270, 0, 0])
		{
			cylinderTemplateZ();
		}
		rotate([315, 0, 0])
		{
			cylinderTemplateZ();
		}
	}
}


spinyBall();
printCameraAndLightSourceParameters();
