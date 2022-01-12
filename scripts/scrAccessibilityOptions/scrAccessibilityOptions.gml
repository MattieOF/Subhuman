function set_menu_effect_enabled(enabled)
{
	if (room != rmMainMenu) return;
	
	global.distortEnabled = enabled;
	layer_set_visible(layer_get_id("UnderwaterEffect"), enabled);
}

function refresh_menu_effect()
{
	set_menu_effect_enabled(global.distortEnabled);
}
