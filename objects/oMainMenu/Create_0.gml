/// @description Init game, declare vars
if (!variable_global_exists("initialised")) setup_game();
refresh_menu_effect();

pressEnterFrame = 0;
pressEnterAlpha = 1;

quitProgress = 0;

/*
0 = press enter
1 = press enter fading out
2 = main menu (for now: go to rmMovementTest)

69 = delete debug menu
		0 = cancel
		1 = reset controls
*/
state = 0;

function start_game()
{
	show_debug_message("start");
}

start_stack("MainMenu", room_width / 2, room_height / 2);
add_to_stack(create_button(0, 0, 150, 50, "New Game", start_game));
add_to_stack(create_button(0, 0, 150, 50, "Quit Game", quit_game));
end_stack();
