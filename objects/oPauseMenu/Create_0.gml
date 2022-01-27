/// @description Function defs, create ui

/*
State
0 = closed
1 = open
2 = load checkpoint menu
*/

state = 0;
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
		if (name == "PauseMenu" || name == "LoadCheckpoint") continue;
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

function open_load_checkpoint()
{
	instance_deactivate_layer("PauseMenu");
	instance_activate_layer("LoadCheckpoint");
	global.pauseMenu.state = 2;
}

function close_load_checkpoint()
{
	instance_activate_layer("PauseMenu");
	instance_deactivate_layer("LoadCheckpoint");
	global.pauseMenu.state = 1;
}

// Create pause menu
// Draw in world means its drawn during the draw gui event, letting it use screen x/y
start_stack("PauseMenu", 100, 100, 5, stackDir.vertical, false);
add_to_stack(create_image(0, 0, sTitle));
add_stack_spacing(10);
add_to_stack(create_label(0, 0, "Pause Menu",,,,,fa_left));
add_stack_spacing(100);
add_to_stack(create_button(0, 0, 200, 40, "Resume", on_resume,,,,,,fa_left));
add_to_stack(create_button(0, 0, 200, 40, "Load Checkpoint", open_load_checkpoint,,,,,,fa_left));
add_to_stack(create_button(0, 0, 200, 40, "Quit", on_menu,,,,,,fa_left));
end_stack();
instance_deactivate_layer("PauseMenu");

start_stack("LoadCheckpoint", 100, 100, 5, stackDir.vertical, false);
add_to_stack(create_image(0, 0, sTitle));
add_stack_spacing(10);
add_to_stack(create_label(0, 0, "Load Checkpoint?",,c_red,,,fa_left));
add_to_stack(create_label(0, 0, "All progress since the last checkpoint will be lost",,,,,fa_left));
add_stack_spacing(100);
add_to_stack(create_button(0, 0, 200, 40, "Yes", room_restart,,,,,,fa_left));
add_to_stack(create_button(0, 0, 200, 40, "No", close_load_checkpoint,,,,,,fa_left));
end_stack();
instance_deactivate_layer("LoadCheckpoint");
