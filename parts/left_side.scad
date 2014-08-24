include <right_side.scad>;

include <../dimensions.scad>;
include <../config.scad>;

// Left side is just same as right side with a mount for the magent
module LeftSidePanel()
{
	RightSidePanel();
}
