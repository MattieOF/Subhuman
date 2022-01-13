/// @description State debug, animations, quit ui logic, and toggle distort

// Menu debug
if (global.debug)
{
	if (keyboard_check_pressed(vk_left))
	{
		state--;
		if (state == 1) pressEnterAlpha = 1;
	}
	if (keyboard_check_pressed(vk_right)) state++;
	if (keyboard_check_pressed(vk_delete)) 
	{
		show_debug_menu();
	}
}

// Fade out press enter
if (state == 1)
{
	if (pressEnterAlpha > 0) pressEnterAlpha -= pressEnterFadePerStep;
	else 
	{
		instance_activate_layer("MainMenu");
		set_layer_interactable("MainMenu", false);
		state = 2;
	}
}

if (state == 2)
{
	currentMainMenuFade++;
	set_layer_alpha("MainMenu", currentMainMenuFade / mainMenuFadeTime);
	if (currentMainMenuFade > mainMenuFadeTime)
	{
		state = 3;
		set_layer_interactable("MainMenu", true);
	}
}

if (state == 4)
{
	currentMainMenuFade--;
	set_layer_alpha("MainMenu", currentMainMenuFade / mainMenuFadeTime);
	if (currentMainMenuFade < 0)
	{
		state = 5;
		instance_deactivate_layer("MainMenu");
	}
}

// Delete debug menu
if (state == 69)
{
	if (keyboard_check_pressed(ord("0"))) reset_debug_menu();
	if (keyboard_check_pressed(ord("1"))) { reset_controls(); reset_debug_menu(); }
}

if (control_check_pressed(controls.quit))
{
	switch (state)
	{
		case 6:
			close_options();
			break;
		case 7:
			close_accessibility_options();
			break;
		default:
			canQuit = true;
	}
} else if (quitProgress == 0) canQuit = false;

if (canQuit && control_check(controls.quit)) 
{
	quitProgress += 0.02;	
	layer_set_visible(layer_get_id("DarkenEffect"), true);
	if (quitProgress >= 1) quit_game();
}
else
{
	quitProgress = 0;
	layer_set_visible(layer_get_id("DarkenEffect"), false);
}

if (control_check_pressed(controls.toggleDistort))
	set_menu_effect_enabled(!global.distortEnabled);
