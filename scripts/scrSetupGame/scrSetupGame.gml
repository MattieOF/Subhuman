function setup_game()
{
	read_options_to_globals();
	global.initialised = true;
}

function quit_game()
{
	save_options_globals();
	game_end();
}
