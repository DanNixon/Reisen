include <../primitive_parts/basic_panels.scad>;

include <../config.scad>;

module DevicePanel()
{
	difference()
	{
		minkowski()
		{
			square([main_width-2*device_front_panel_corner_radius,
					main_height-2*device_front_panel_corner_radius-hinge_radius],
					center=true);
			circle(r=device_front_panel_corner_radius);
		}

		// Cutout for camera
		translate([camera_cutout_offset_x, camera_cutout_offset_y])
			minkowski()
			{
				square([camera_cutout_width-device_front_panel_cutout_corner_radius,
						camera_cutout_height-device_front_panel_cutout_corner_radius],
						center=true);
				circle(r=device_front_panel_cutout_corner_radius);
			}
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

res = default_res;
$fn = res;

DevicePanel();
