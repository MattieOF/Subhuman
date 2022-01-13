// UI system

global.uiobj_button = oButton;
global.uilayer = undefined;

enum uiItemType
{
	button
}

function UI() constructor
{
	ensure_ui_layer_exists();
	items = [];
	selectedIndex = undefined;
}

function Button(_x, _y) constructor
{
	ensure_ui_layer_exists();
	objectId = instance_create_layer(_x, _y, global.uilayer, global.uiobj_button);
	type = uiItemType.button;
	selectable = true; // Todo: Implement
}

function ensure_ui_layer_exists()
{
	if (!layer_exists(global.uilayer))
		global.uilayer = layer_create(-100, "UI");
}

function add_element_to_ui(ui, element)
{	
	if (!variable_struct_exists(ui, "items")) 
	{
		show_debug_message("Invalid UI!");
		return;
	}
	
	if (!variable_struct_exists(element, "type")) 
	{
		show_debug_message("Invalid UI element!");
		return;
	}
	
	array_push(ui.items, element);
}

function ui_select(ui, index)
{
	if (!variable_struct_exists(ui, "items")) 
	{
		show_debug_message("Invalid UI!");
		return;
	}
	
	if (index < 0 || index > array_length(ui.items) - 1)
	{
		show_debug_message("Index out of range!");
		return;
	}
	
	ui_set_element_selected(ui, ui.selectedIndex, false);
	ui_set_element_selected(ui, index, true);
}

function ui_set_element_selected(ui, index, selected)
{
	if (!variable_struct_exists(ui, "items")) 
	{
		show_debug_message("Invalid UI!");
		return;
	}
	
	if (index < 0 || index > array_length(ui.items) - 1)
	{
		show_debug_message("Index out of range!");
		return;
	}
	
	// TODO: select item
	
	
	if (selected == true) ui.selectedIndex = index;
}

function ui_select_next(ui)
{
	if (!variable_struct_exists(ui, "items")) 
	{
		show_debug_message("Invalid UI!");
		return;
	}
	
	if (array_length(ui.items) == 0) return;
	
	if (ui.selectedIndex == undefined)
	{
		ui_select(ui, 0);
		return;
	}
	
	var ind = ui.selectedIndex;
	ind++;
	ind %= array_length(ui.items);
	
	ui_select(ui, ind);
}

function ui_select_previous(ui)
{
	if (!variable_struct_exists(ui, "items")) 
	{
		show_debug_message("Invalid UI!");
		return;
	}
	
	if (array_length(ui.items) == 0) return;
	
	if (ui.selectedIndex == undefined)
	{
		ui_select(ui, array_length(ui.items) - 1);
		return;
	}
	
	var ind = ui.selectedIndex;
	ind--;
	ind %= array_length(ui.items);
	
	ui_select(ui, ind);
}

function ui_element_set_alpha(ui, index, alpha)
{
	
}
