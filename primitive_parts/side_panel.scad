include <../primitive_parts/basic_panels.scad>;

include <../config.scad>;

module SidePanel()
{
	module HingeCirclePair(dx)
	{
		translate([dx, 0])
		{
			translate([0, -(main_height/2)+hinge_radius])
				circle(r=hinge_radius, centre=true);
			translate([0, (main_height/2)-hinge_radius])
				circle(r=hinge_radius, centre=true);
		}
	}

	function hingeHoleRadius() =
			sqrt(material_thickness*material_thickness+material_thickness*material_thickness) / 2 + hinge_tolerance;

	difference()
	{
		BasicPanelWithEndTabs(main_depth, main_height,
				top_slot_width, material_thickness,
				top_slot_spacing,
				side_panel_corner_radius)
		{
			// Clearance slot for glasses
			if(glasses)
				translate([(-(main_depth/4))+glasses_cutout_offset_x-side_panel_corner_radius, glasses_cutout_offset_y])
					minkowski()
					{
						square([glasses_cutout_width, glasses_cutout_height], center=true);
						circle(r=side_panel_corner_radius);
					}
			children();
		}

		// Slot for lens panel
		minkowski()
		{
			square([material_thickness, lens_panel_side_slot_width], center=true);
			circle(r=slot_tolerance);
		}

		// Rounded corners for inside of cutout
		if(glasses)
			translate([(-(main_depth/4))+glasses_cutout_offset_x-side_panel_corner_radius+glasses_cutout_width/2, glasses_cutout_offset_y])
				hull()
				{
					translate([0, glasses_cutout_height/2-side_panel_corner_radius])
						circle(r=side_panel_corner_radius, center=true);
					translate([0, -glasses_cutout_height/2+side_panel_corner_radius])
						circle(r=side_panel_corner_radius, center=true);
				}
	}

	// Device panel hinge
	difference()
	{
		hull()
		{
			HingeCirclePair((main_depth/2)+material_thickness+device_thickness);
			HingeCirclePair(main_depth/2);
		}

		translate([(main_depth/2)+material_thickness+device_thickness, 0])
		{
			translate([0, -(main_height/2)+hinge_radius])
				circle(r=hingeHoleRadius(), centre=true);

			translate([0, (main_height/2)-hinge_radius])
				circle(r=hingeHoleRadius(), centre=true);
		}

		children();
	}
}

module CableHole()
{
	translate([(main_depth+device_thickness)/2+cable_cutout_offset_x,
			cable_cutout_offset_y])
		minkowski()
		{
			square([cable_cutout_width-(2*cable_cutout_corner_radius),
					cable_cutout_height-(2*cable_cutout_corner_radius)], center=true);
			circle(r=cable_cutout_corner_radius);
		}
}
