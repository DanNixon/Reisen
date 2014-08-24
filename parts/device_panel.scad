include <../primitive_parts/basic_panels.scad>;

include <../dimensions.scad>;
include <../config.scad>;

module DevicePanel()
{
	minkowski()
	{
		square([main_width-2*device_front_panel_corner_radius,
				main_height-2*device_front_panel_corner_radius-hinge_radius],
				center=true);
		circle(r=device_front_panel_corner_radius);
	}

	// Bottom hinge tabs
	translate([0, -(main_height-1.5*hinge_radius-material_thickness)/2])
		TabPair(material_thickness,
				material_thickness,
				(main_width+material_thickness)/2);

	// Top fastening snaps
	translate([0, (main_height-1.5*hinge_radius-material_thickness)/2])
		TabPair(device_snap_latch_len,
				material_thickness,
				(main_width+device_snap_latch_len)/2);
}
