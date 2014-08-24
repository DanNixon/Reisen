include <../primitive_parts/basic_panels.scad>;

include <../dimensions.scad>;
include <../config.scad>;

module ScreenDividerPanel()
{
	difference()
	{
		union()
		{
			BasicPanelWithEndTabs((main_depth-material_thickness)/2, main_height,
					screen_divider_tab_width, material_thickness,
					screen_divider_tab_spacing);

			//TODO: Lens panel tab
		}

		//TODO: Nose cutout
	}
}
