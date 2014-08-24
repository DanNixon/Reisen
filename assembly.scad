include <parts/top.scad>;
include <parts/bottom.scad>;
include <parts/left_side.scad>;
include <parts/right_side.scad>;
include <parts/lens_holder.scad>;

include <dimensions.scad>;

midpoint_z_offset = (main_height + material_thickness) / 2;

module Extrude(colour=[0,0,0,1])
{
	color(colour)
		linear_extrude(height=material_thickness, center=true)
			child();
}

module RotateAndExtrudePanel(dx=0, colour=[0,0,0,1])
{
	translate([dx, 0, midpoint_z_offset])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				color(colour)
					linear_extrude(height=material_thickness, center=true)
						child();
}

Extrude(bottom_panel_colour)
	BottomPanel();

translate([0, 0, main_height + material_thickness])
	Extrude(top_panel_colour)
		TopPanel();

RotateAndExtrudePanel(dx=-(main_width/2), colour=left_side_panel_colour)
	LeftSidePanel();

RotateAndExtrudePanel(dx=(main_width/2), colour=right_side_panel_colour)
	RightSidePanel();

translate([0, 0, midpoint_z_offset])
	rotate([90, 0, 0])
		Extrude(lens_holder_panel_colour)
			LensHolderPanel();
