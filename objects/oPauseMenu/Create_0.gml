/// @description Function defs, create ui

enabled = false;
pauseMenuCol = make_color_rgb(100, 100, 100);
global.pauseMenu = id;

function deactivate_layers()
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++;)
	{
		var name = layer_get_name(a[i]);
		if (name == "Instances" || name == "Background") continue;
		instance_deactivate_layer(a[i]);
	}
}

function activate_layers()
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++;)
	{
		var name = layer_get_name(a[i]);
		instance_activate_layer(a[i]);
	}
}

function on_resume()
{
	with(global.pauseMenu) event_user(1);
}

function on_menu()
{
	room_goto(rmMainMenu);
}

// Create pause menu
// Draw in world means its drawn during the draw gui event, letting it use screen x/y
start_stack("PauseMenu", 100, 100, 5, stackDir.vertical);
var title = create_image(0, 0, sTitle);
title.drawInWorld = false;
add_to_stack(title);
add_stack_spacing(10);
var lbl = create_label(0, 0, "Pause Menu",,,,,fa_left);
lbl.drawInWorld = false;
add_to_stack(lbl);
add_stack_spacing(100);
var resume = create_button(0, 0, 150, 50, "Resume", on_resume);
resume.drawInWorld = false;
add_to_stack(resume);
resume.x += 75;
var menu = create_button(0, 0, 150, 50, "Quit", on_menu);
menu.drawInWorld = false;
add_to_stack(menu);
menu.x += 75;
end_stack();
instance_deactivate_layer("PauseMenu");
