include <../primitive_parts/basic_panels.scad>;

include <../dimensions.scad>;

module TopPanel()
{
	difference()
	{
		BasicPanelWithSideSlots(main_width, main_depth,
				material_thickness,
				top_slot_width, top_slot_spacing,
				top_bottom_corner_rounding_radius);

		rotate(90)
			SlotPair(material_thickness,
					lens_panel_top_bottom_slot_width,
					lens_panel_top_bottom_slot_spacing);
	}
}
