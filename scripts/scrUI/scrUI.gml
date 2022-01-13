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
	instance_create_layer(_x, _y, global.uilayer, global.uiobj_button);
	type = uiItemType.button;
	selectable = true;
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

function ui_select_next()
{
	array_
}
