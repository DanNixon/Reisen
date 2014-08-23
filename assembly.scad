include <parts/top.scad>;
include <parts/bottom.scad>;
include <parts/left_side.scad>;
include <parts/right_side.scad>;

include <dimensions.scad>;

module RotateAndExtrudeSidePanel(dx=0)
{
	translate([dx, 0, (main_height/2)+(material_thickness/2)])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(height=material_thickness, center=true)
					child();
}

linear_extrude(height=material_thickness, center=true)
	BottomPanel();

translate([0, 0, main_height + material_thickness])
	linear_extrude(height=material_thickness, center=true)
		TopPanel();

RotateAndExtrudeSidePanel(dx=-(main_width/2))
	LeftSidePanel();

RotateAndExtrudeSidePanel(dx=(main_width/2))
	RightSidePanel();