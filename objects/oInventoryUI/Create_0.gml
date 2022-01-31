/// @description Function defs

/*
0 = closed
1 = viewing
2 = select item
*/
state = 0;
bgTint = make_color_rgb(100, 100, 100);
global.inv = id;
selectionObj = undefined;

normalColor = $1a1a1a;
hoveredColor = $3b3b3b;
selectedColor = $616161;
textNormal = c_white;
textEmpty = c_dkgray;

function init(_player)
{
	player = _player;
}

function use_selected()
{
	with (global.inv)
	{
		if (selectionObj == undefined) return;
		if (selectedItem == -1 || selectedItem == undefined) return;
		close_inventory();
		selectionObj.check_item_used(player.inventory[selectedItem]);
		if (consume) player.inventory_remove_index(selectedItem);
	}
}

function drop(_index)
{
	instance_create_layer(player.x, player.y, "Level", oItem).init(player.inventory[_index]);
	player.inventory_remove_index(_index);
}

function open_inventory(_selectionObj = undefined, _consume = false)
{
	// Don't open if something else is already using the pause surface.
	if (surface_exists(global.pauseSurface)) return;
	
	event_user(0);
	state = 1;
	selectedItem = -1;
	selectionObj = undefined;
	consume = false;
	if (_selectionObj != undefined)
	{
		selectionObj = _selectionObj;
		consume = _consume;
		state = 2;
		instance_activate_layer("SelectionUI");
	}
}

function close_inventory()
{
	with (global.inv)
	{
		event_user(1);
		state = 0;
	}
}

// Create selection UI
start_stack("SelectionUI", 100, global.displayHeight - 100, 10, stackDir.horizontal, false);
add_to_stack(create_button(0, 0, 150, 40, "Select", use_selected,,,,,,fa_left));
add_to_stack(create_button(0, 0, 150, 40, "Cancel", close_inventory,,,,,,fa_left));
end_stack();
instance_deactivate_layer("SelectionUI");
