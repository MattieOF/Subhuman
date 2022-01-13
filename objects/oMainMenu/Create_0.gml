/// @description Init game, declare vars
if (!variable_global_exists("initialised")) setup_game();
refresh_menu_effect();

pressEnterFrame = 0;
pressEnterAlpha = 1;

quitProgress = 0;

mainMenuFadeTime = 1 * room_speed;
currentMainMenuFade = 0;

/*
0 = press enter
1 = press enter fading out
2 = main menu fade in
3 = main menu
4 = main menu fading out
5 = go to rmgame
6 = options

69 = delete debug menu
		0 = cancel
		1 = reset controls
*/
state = 0;
global.mainMenu = id;

function start_game()
{
	global.mainMenu.state = 4;
	set_layer_interactable("MainMenu", false);
}

function open_options()
{
	global.mainMenu.state = 6;
	instance_deactivate_layer("MainMenu");
	instance_activate_layer("Options");
}

function close_options()
{
	global.mainMenu.state = 3;
	instance_deactivate_layer("Options");
	instance_activate_layer("MainMenu");
}

function show_debug_menu()
{
	if (state == 69) return;
	layer_set_visible("MainMenu", false);
	global.menuMenuOldState = state;
	state = 69;
}

function reset_debug_menu()
{
	state = global.menuMenuOldState;
	layer_set_visible("MainMenu", true);
}

start_stack("MainMenu", room_width / 2, room_height / 2);
add_to_stack(create_button(0, 0, 150, 50, "New Game", start_game, id));
add_to_stack(create_button(0, 0, 150, 50, "Options", open_options));
add_to_stack(create_button(0, 0, 150, 50, "Extras", undefined));
add_to_stack(create_button(0, 0, 150, 50, "Quit Game", quit_game,,,,c_red,make_color_rgb(50, 0, 0)));
end_stack();
instance_deactivate_layer("MainMenu");

start_stack("Options", room_width / 2, 250);
add_to_stack(create_label(0, 0, "Options"));
add_stack_spacing(100);
add_to_stack(create_button(0, 0, 150, 50, "Back", close_options));
end_stack();
instance_deactivate_layer("Options");
