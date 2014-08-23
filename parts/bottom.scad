include <../primitive_parts/basic_panels.scad>;
include <../dimensions.scad>;

module BottomPanel()
{
	BasicPanelWithSideSlots(main_width, main_depth, material_thickness, top_slot_width, top_slot_spacing);
}
