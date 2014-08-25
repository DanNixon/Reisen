use <right_side.scad>;

include <../dimensions.scad>;
include <../config.scad>;

// Left side is just same as right side with a mount for the magent
module LeftSidePanel()
{
	RightSidePanel();
}

res = default_res;
$fn = res;

LeftSidePanel();
