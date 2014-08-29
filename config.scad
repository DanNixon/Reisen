// A couple of useful constants
LEFT = 1;
RIGHT = 2;

// Default preview and image resolution
default_res = 80;

// Set to true to allow extra space for glasses
glasses = true;

// Colour of parts on assembly
top_panel_colour 					= [0.2, 0.6, 0.8];
bottom_panel_colour 			= [0.2, 0.6, 0.8];
left_side_panel_colour 		= [0.8, 0.4, 0.2];
right_side_panel_colour 	= [0.8, 0.4, 0.2];
lens_holder_panel_colour 	= [0.8, 0.3, 0.4];
screen_divider_colour 		= [0.5, 0.5, 0.5];
device_panel_colour 			= [0.2, 0.8, 0.4];
magnet_guide_colour 			= [0.8, 0.4, 0.6];
lens_clip_colour 					= [0.4, 0.5, 0.5];

// Thickness of material used
material_thickness = 3;
screen_divider_material_thickness = 3;

// Dimensions related to lens and mount
lens_diameter = 24;
lens_clip_width = 5;
lens_clip_tab_radius = 2;
num_lens_tabs = 3;

// Dimensions related to "select" magent
magnet_diameter = 20;
magnet_travel = 12;
magnet_guide_width = 5;
magnet_guide_offset_x = 30;
magnet_guide_offset_y = 15;

// Width of the obile phone used
device_thickness = 12;

// Dimensions of manin box assembly
main_width = 138; 	// Ensure this is greater then the height fo your device
main_depth = 80;
main_height = 75;

// Size and position of slots used on main
// box assembly
top_slot_width = 20;
top_slot_spacing = 20;

// Assembly slots on top and bottom of lens panel
lens_panel_top_bottom_slot_width = 20;
lens_panel_top_bottom_slot_spacing = 40;

// Assembly slots of side of lens panel
lens_panel_side_slot_width = 20;

// Position of lens
lens_offset_x = 34;
lens_offset_y = 0;

// Size of nose cutout on lens holder panel
nose_cutout_base_width = 35;
nose_cutout_top_width = 20;
nose_cutout_height = 28;

// Size of the camera cutout on the front of the
// device panel
camera_cutout_width = 25;
camera_cutout_height = 30;

// Position of the camera cutout relative to the
// centre of the device panel
camera_cutout_offset_x = -45;
camera_cutout_offset_y = 0;

// Size and position of cutout section for glasses clearance
glasses_cutout_offset_x = -5;
glasses_cutout_offset_y = 5;
glasses_cutout_width = 35;
glasses_cutout_height = 40;

// Screen divider assembly tab sizes
screen_divider_tab_width = 5;
screen_divider_tab_spacing = 10;
lens_screen_divider_tab_width = 20;
lens_screen_divider_tab_offset_y = 15;

// Corner rounding radii
top_bottom_corner_rounding_radius = 3;
side_panel_corner_radius = 3;
glasses_cutout_corner_rounding_radius = 5;
device_front_panel_corner_radius = 1;
device_front_panel_cutout_corner_radius = 5;

head_curve_offset_y = material_thickness / 2;

// Size for front device panel hinges
hinge_radius = 5;
hinge_tolerance = 0.25;
device_snap_latch_len = 1;

// Size and position of cable cutout
cable_cutout_side = RIGHT;
cable_cutout_width = 8;
cable_cutout_height = 35;
cable_cutout_offset_x = 2;
cable_cutout_offset_y = 8;
cable_cutout_corner_radius = 2;
