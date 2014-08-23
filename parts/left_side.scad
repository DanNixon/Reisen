include <../primitive_parts/basic_panels.scad>;
include <../dimensions.scad>;

module LeftSidePanel()
{
	BasicPanelWithEndTabs(main_depth, main_height, top_slot_width, material_thickness, top_slot_spacing);
}
