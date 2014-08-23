//Note: r=(d/2) is only used because Debian take their time updating package versions

module NoseCurve(w, h, d)
{
	hull()
	{
		translate([0, h-(d/2)])
			circle(r=(d/2), center=true);

		circle(r=(w/2), center=true);
	}
}
