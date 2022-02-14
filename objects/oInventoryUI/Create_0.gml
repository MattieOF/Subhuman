/// @description Function defs

/*
0 = closed
1 = viewing
2 = select item
3 = viewing note
*/
state = 0;
bgTint = make_color_rgb(100, 100, 100);
global.inv = id;
selectionObj = undefined;
currentNote = undefined;

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
		var success = selectionObj.check_item_used(player.inventory[selectedItem]);
		if (success && consume) player.inventory_remove_index(selectedItem);
	}
}

function show_note(_note)
{
	with (global.inv)
	{
		instance_activate_layer("CloseUI");
		instance_deactivate_layer("UseUI");
		currentNote = _note;
		state = 3;
	}
}

function close_note()
{
	with (global.inv)
	{
		instance_activate_layer("UseUI");
		instance_deactivate_layer("CloseUI");
		state = 1;
	}
}

function use_in_inv()
{
	with (global.inv)
	{
		if (selectedItem == -1 || selectedItem == undefined) return;
		
		switch (player.inventory[selectedItem].use)
		{
			case itemUse.none: return;
			case itemUse.healing:
				close_inventory();
				oPlayer.heal(player.inventory[selectedItem].healAmount);
				player.inventory_remove_index(selectedItem);
				break;
			case itemUse.note:
				show_note(player.inventory[selectedItem]);
				break;
		}
	}
}

function drop(_index)
{
	instance_create_layer(player.x, player.y, "Level", oItem).init(player.inventory[_index]);
	player.inventory_remove_index(_index);
	if (selectedItem == _index) selectedItem = -1;
	instance_deactivate_layer("UseUI");
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

start_stack("UseUI", 100, global.displayHeight - 100, 10, stackDir.horizontal, false);
useButton = create_button(0, 0, 150, 40, "Use", use_in_inv,,,,,,fa_left);
add_to_stack(useButton);
end_stack();
instance_deactivate_layer("UseUI");

start_stack("CloseUI", 100, global.displayHeight - 100, 10, stackDir.horizontal, false);
add_to_stack(create_button(0, 0, 150, 40, "Close", close_note,,,,,,fa_left));
end_stack();
instance_deactivate_layer("CloseUI");
