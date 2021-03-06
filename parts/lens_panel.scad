include <../primitive_parts/basic_panels.scad>;
include <../primitive_parts/curves.scad>;

include <../config.scad>;

module LensPanel()
{
	difference()
	{
		union()
		{
			// Panel with top and bottom tabs
			BasicPanelWithEndTabs(main_width, main_height,
					lens_panel_top_bottom_slot_width, material_thickness,
					lens_panel_top_bottom_slot_spacing);

			// Right hand assembly tab
			translate([(main_width+material_thickness)/2, 0])
				square([material_thickness, lens_panel_side_slot_width], center=true);

			// Left hand assembly tab
			translate([-(main_width+material_thickness)/2, 0])
				square([material_thickness, lens_panel_side_slot_width], center=true);
		}

		// Screen divider assembly slot
		translate([0, lens_screen_divider_tab_offset_y])
			minkowski()
			{
				square([screen_divider_material_thickness, lens_screen_divider_tab_width], center=true);
				circle(r=slot_tolerance);
			}

		// Nose cutout
		translate([0, -(main_height/2)])
			NoseCurve(nose_cutout_base_width,
					nose_cutout_height,
					nose_cutout_top_width);

		// Right lens
		translate([lens_offset_x, lens_offset_y])
			circle(d=lens_diameter);

		// Left lens
		translate([-lens_offset_x, lens_offset_y])
			circle(d=lens_diameter);
	}
}

res = default_res;
$fn = res;

LensPanel();
