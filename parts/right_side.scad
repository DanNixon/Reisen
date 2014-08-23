include <../primitive_parts/basic_panels.scad>;

include <../dimensions.scad>;

module RightSidePanel()
{
	difference()
	{
		BasicPanelWithEndTabs(main_depth, main_height, top_slot_width, material_thickness, top_slot_spacing);

		// Slot for lens panel
		square([material_thickness, lens_panel_side_slot_width], center=true);
	}
}
