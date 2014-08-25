use <parts/top.scad>;
use <parts/bottom.scad>;
use <parts/left_side.scad>;
use <parts/right_side.scad>;
use <parts/lens_holder.scad>;
use <parts/screen_divider.scad>;
use <parts/device_panel.scad>;

include <dimensions.scad>;
include <config.scad>;

midpoint_z_offset = (main_height + material_thickness) / 2;

res = default_res;
$fn = res;

module Extrude(colour=[0,0,0,1])
{
	color(colour)
		linear_extrude(height=material_thickness, center=true)
			children();
}

module RotateAndExtrudePanel(dx=0, colour=[0,0,0,1], thickness=material_thickness)
{
	translate([dx, 0, midpoint_z_offset])
		rotate([0, 90, 0])
			rotate([0, 0, 90])
				color(colour)
					linear_extrude(height=thickness, center=true)
						children();
}

Extrude(bottom_panel_colour)
	BottomPanel();

translate([0, 0, main_height + material_thickness])
	Extrude(top_panel_colour)
		TopPanel();

RotateAndExtrudePanel(dx=-(main_width+material_thickness)/2, colour=left_side_panel_colour)
	LeftSidePanel();

RotateAndExtrudePanel(dx=(main_width+material_thickness)/2, colour=right_side_panel_colour)
	RightSidePanel();

translate([0, 0, midpoint_z_offset])
	rotate([90, 0, 0])
		Extrude(lens_holder_panel_colour)
			LensHolderPanel();

translate([0, (main_depth+material_thickness)/4, 0])
	RotateAndExtrudePanel(colour=screen_divider_colour, thickness=screen_divider_material_thickness)
		ScreenDividerPanel();

translate([0, (main_depth/2)+material_thickness+device_thickness, midpoint_z_offset])
	rotate([90, 0, 0])
		Extrude(device_panel_colour)
			DevicePanel();
