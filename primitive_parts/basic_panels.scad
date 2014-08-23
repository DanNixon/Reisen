material_thickness = 3;

module BasicPanelWithSideSlots(w, h, slot_width, slot_height, slot_offset_y)
{
	module SlotPair(slot_width, slot_height, offset_y)
	{
		translate([0, offset_y])
			square([slot_width, slot_height], center=true);
		translate([0, -offset_y])
			square([slot_width, slot_height], center=true);
	}

	difference()
	{
		square([(w + 4 * slot_width), h], center=true);

		union()
		{
			translate([(w/2), 0])
				SlotPair(slot_width, slot_height, slot_offset_y);

			translate([-(w/2), 0])
				SlotPair(slot_width, slot_height, slot_offset_y);
		}
	}
}

module BasicPanelWithEndTabs(w, h, tab_width, tab_height, tab_offset_x)
{
	module TabPair(tab_width, tab_height, offset_x)
	{
		translate([offset_x, 0])
			square([tab_width, tab_height], center=true);
		translate([-offset_x, 0])
			square([tab_width, tab_height], center=true);
	}

	square([w, h], center=true);

	translate([0, (h/2)+(tab_height/2)])
		TabPair(tab_width, tab_height, tab_offset_x);

	translate([0, -(h/2)-(tab_height/2)])
		TabPair(tab_width, tab_height, tab_offset_x);
}
