include <../dimensions.scad>;
include <../config.scad>;

module LensClip()
{
	difference()
	{
		circle(d=lens_diameter+(lens_clip_width*2), centre=true);
		circle(d=lens_diameter, center=true);
	}

	d_theta = 360 / num_lens_tabs;
	for(theta = [0 : d_theta : 359])
	{
		rotate(theta)
			translate([0, lens_diameter/2])
				circle(r=lens_clip_tab_radius, center=true);
	}
}

res = default_res;
$fn = res;

LensClip();
