module NoseCurve(w, h, d)
{
	hull()
	{
		translate([0, h-(d/2)])
			circle(d=d, center=true);

		circle(d=w, center=true);
	}
}

module ellipse(width, height, center=true)
{
	scale([1, height/width, 1])
		circle(d=width, center=center);
}
