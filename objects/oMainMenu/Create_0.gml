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
7 = accessibility options

69 = delete debug menu
		0 = cancel
		1 = reset controls
		2 = goto movement test
*/
state = 0;
global.mainMenu = id;
canQuit = false;
titleGraphic = sTitle;
halfTitleGraphicWidth = sprite_get_width(titleGraphic) / 2;
titleGraphicAlpha = 1;
window_set_cursor(cr_default); // Ensure cursor is shown

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
	save_options_globals();
	global.mainMenu.state = 3;
	instance_deactivate_layer("Options");
	instance_activate_layer("MainMenu");
}

function open_accessibility_options()
{
	global.mainMenu.state = 7;
	instance_deactivate_layer("Options");
	instance_activate_layer("AccessibilityOptions");
}

function close_accessibility_options()
{
	global.mainMenu.state = 6;
	instance_deactivate_layer("AccessibilityOptions");
	instance_activate_layer("Options");
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

function set_fullscreen(value)
{
	window_set_fullscreen(value);
}

function set_debugmode(value)
{
	global.debug = value;
}

start_stack("MainMenu", room_width / 2, room_height / 2);
add_to_stack(create_button(0, 0, 150, 50, "New Game", start_game, id));
add_to_stack(create_button(0, 0, 150, 50, "Options", open_options));
add_to_stack(create_button(0, 0, 150, 50, "Extras", undefined));
add_to_stack(create_button(0, 0, 150, 50, "Quit Game", quit_game,,,,c_red,make_color_rgb(148, 10, 0)));
end_stack();
instance_deactivate_layer("MainMenu");

start_stack("Options", room_width / 2, 250);
add_to_stack(create_label(0, 0, "Options"));
add_stack_spacing(50);
add_to_stack(create_checkbox(0, 0, "Fullscreen", set_fullscreen, window_get_fullscreen()));
if (global.debug) add_to_stack(create_checkbox(0, 0, "Debug Mode", set_debugmode, global.debug));
add_stack_spacing(20);
add_to_stack(create_button(0, 0, 150, 50, "Accessibility", open_accessibility_options));
global.ui_currentY = room_height - 60;
add_to_stack(create_button(0, 0, 150, 50, "Back", close_options));
end_stack();
instance_deactivate_layer("Options");

start_stack("AccessibilityOptions", room_width / 2, 250);
add_to_stack(create_label(0, 0, "Accessibility Options"));
add_stack_spacing(50);
add_to_stack(create_checkbox(0, 0, "Menu Distortion Effect", set_menu_effect_enabled, global.distortEnabled));
global.ui_currentY = room_height - 60;
add_to_stack(create_button(0, 0, 150, 50, "Back", close_accessibility_options));
end_stack();
instance_deactivate_layer("AccessibilityOptions");
