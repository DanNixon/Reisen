include <../primitive_parts/basic_panels.scad>;

include <../dimensions.scad>;
include <../config.scad>;

module RightSidePanel()
{
	difference()
	{
		BasicPanelWithEndTabs(main_depth, main_height,
				top_slot_width, material_thickness,
				top_slot_spacing);

		// Slot for lens panel
		square([material_thickness, lens_panel_side_slot_width], center=true);

		if(glasses)
			translate([(-(main_depth/4))+glasses_cutout_offset_x, glasses_cutout_offset_y])
				square([glasses_cutout_width, glasses_cutout_height], center=true);
	}
}
