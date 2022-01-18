function setup_game()
{
	read_options_to_globals();
	global.pauseSurface = -1;
	global.initialised = true;
	
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
