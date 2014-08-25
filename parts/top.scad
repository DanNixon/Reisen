include <../primitive_parts/basic_panels.scad>;
include <../primitive_parts/curves.scad>;

include <../dimensions.scad>;
include <../config.scad>;

module TopPanel()
{
	difference()
	{
		BasicPanelWithSideSlots(main_width, main_depth,
				material_thickness,
				top_slot_width, top_slot_spacing,
				top_bottom_corner_rounding_radius)
		{
			// Head mount ellipse
			translate([0, (-main_depth/2)+head_curve_offset_y])
				ellipse(width=main_width, height=main_depth, center=true);
		}

		// Lens panel assembly slots
		rotate(90)
			SlotPair(material_thickness,
					lens_panel_top_bottom_slot_width,
					lens_panel_top_bottom_slot_spacing);

		// Screen divider assembly slots
		translate([0, (main_depth+material_thickness)/4])
			SlotPair(screen_divider_material_thickness,
					screen_divider_tab_width,
					screen_divider_tab_spacing);
	}
}

res = default_res;
$fn = res;

TopPanel();
