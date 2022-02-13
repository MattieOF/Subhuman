function setup_game()
{
	read_options_to_globals();
	global.pauseSurface = -1;
	global.gameOverSurface = -1;
	global.positions = {};
	global.doors = {};
	global.initialised = true;
	draw_set_font(fntMain);

	var pCount = parameter_count();
	if (pCount > 0)
	{
		for (var i = 0; i < pCount; i++)
		{
			if (parameter_string(i + 1) == "debugmode")
				global.debug = true;
			else if (parameter_string(i + 1) == "nodebugmode")
				global.debug = false;
		}
	}
}

function quit_game()
{
	save_options_globals();
	game_end();
}
