include <parts/top.scad>;
include <parts/bottom.scad>;
include <parts/left_side.scad>;
include <parts/right_side.scad>;
include <parts/lens_holder.scad>;

include <dimensions.scad>;

midpoint_z_offset = (main_height + material_thickness) / 2;

module Extrude()
{
	linear_extrude(height=material_thickness, center=true)
		child();
}

module RotateAndExtrudeSidePanel(dx=0)
{
	translate([dx, 0, midpoint_z_offset])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				linear_extrude(height=material_thickness, center=true)
					child();
}

Extrude()
	BottomPanel();

translate([0, 0, main_height + material_thickness])
	Extrude()
		TopPanel();

RotateAndExtrudeSidePanel(dx=-(main_width/2))
	LeftSidePanel();

RotateAndExtrudeSidePanel(dx=(main_width/2))
	RightSidePanel();

translate([0, 0, midpoint_z_offset])
	rotate([90, 0, 0])
		Extrude()
			LensHolderPanel();
