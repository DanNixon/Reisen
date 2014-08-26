include <../primitive_parts/side_panel.scad>;

include <../config.scad>;

module RightSidePanel()
{
	SidePanel()
		if(cable_cutout_side == RIGHT)
			CableHole();
}

res = default_res;
$fn = res;

RightSidePanel();
