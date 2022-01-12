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
*/
state = 0;
