include <../primitive_parts/basic_panels.scad>;
include <../primitive_parts/curves.scad>;

include <../dimensions.scad>;
include <../config.scad>;

module ScreenDividerPanel()
{
	x = (main_depth - material_thickness) / 2;

	difference()
	{
		union()
		{
			BasicPanelWithEndTabs(x, main_height,
					screen_divider_tab_width, material_thickness,
					screen_divider_tab_spacing);

			// Lens panel tab
			translate([-(x/2)-(material_thickness/2), lens_screen_divider_tab_offset_y])
				square([material_thickness, lens_screen_divider_tab_width], center=true);
		}

		// Nose cutout
		translate([-x/2, -(main_height/2)])
			NoseCurve(nose_cutout_height+nose_cutout_top_width,
					nose_cutout_height,
					nose_cutout_top_width);
	}
}