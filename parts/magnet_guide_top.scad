include <../config.scad>;

module MagnetGuideTop()
{
	dx = magnet_travel / 2;
	d_outer = magnet_diameter + (magnet_guide_width * 2);

	difference()
	{
		hull()
		{
			translate([0, -dx])
				circle(d=d_outer, center=true);

			translate([0, dx])
				circle(d=d_outer, center=true);
		}

		hull()
		{
			translate([0, -dx])
				circle(d=magnet_finger_hole, center=true);

			translate([0, dx])
				circle(d=magnet_finger_hole, center=true);
		}
	}
}

res = default_res;
$fn = res;

MagnetGuideTop();
