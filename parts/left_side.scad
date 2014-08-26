include <../primitive_parts/side_panel.scad>;

include <../config.scad>;

module LeftSidePanel()
{
	SidePanel()
		if(cable_cutout_side == LEFT)
			CableHole();
}

res = default_res;
$fn = res;

LeftSidePanel();
