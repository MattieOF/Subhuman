/// @description Function defs

/*
0 = closed
1 = viewing
2 = select item
*/
state = 0;
bgTint = make_color_rgb(100, 100, 100);
global.inv = id;

normalColor = $1a1a1a;
hoveredColor = $3b3b3b;
selectedColor = $707070;

function init(_player)
{
	player = _player;
}

function use_selected()
{
	
}

function open_inventory(_selectionObj = undefined)
{
	// Don't open if something else is already using the pause surface.
	if (surface_exists(global.pauseSurface)) return;
	
	event_user(0);
	state = 1;
	selectedItem = -1;
	if (_selectionObj != undefined)
	{
		selectionObj = _selectionObj;
		state = 2;
		instance_activate_layer("SelectionUI");
	}
}

function close_inventory()
{
	with (global.inv)
	{
		event_user(1);
		selectionObj = undefined;
		state = 0;
	}
}

// Create selection UI
start_stack("SelectionUI", 100, global.displayHeight - 100, 10, stackDir.horizontal, false);
add_to_stack(create_button(0, 0, 150, 40, "Select", use_selected,,,,,,fa_left));
add_to_stack(create_button(0, 0, 150, 40, "Cancel", close_inventory,,,,,,fa_left));
end_stack();
instance_deactivate_layer("SelectionUI");
