include <../config.scad>;

module MagnetGuide()
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
				circle(d=magnet_diameter, center=true);

			translate([0, dx])
				circle(d=magnet_diameter, center=true);
		}
	}
}

res = default_res;
$fn = res;

MagnetGuide();
