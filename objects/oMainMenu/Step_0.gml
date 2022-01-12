if (global.debug)
{
	if (keyboard_check_pressed(vk_left))
	{
		state--;
		if (state == 1) pressEnterAlpha = 1;
	}
	if (keyboard_check_pressed(vk_right)) state++;
}

if (state == 1)
{
	if (pressEnterAlpha > 0) pressEnterAlpha -= pressEnterFadePerStep;
	else state = 2;
}

if (control_check(controls.quit)) 
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
