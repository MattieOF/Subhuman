/// @desc Reads options from the ini file into globals and set functions
function read_options_to_globals()
{
	ini_open("Subhuman.ini");
	global.debug = ini_read_real("General", "DebugMode", 0);
	global.distortEnabled = ini_read_bool("General", "MenuEffectEnabled", true);
	window_set_fullscreen(ini_read_bool("General", "Fullscreen", false));
	ini_close();
}

/// @desc Saves options stored in globals (or get functions) to the ini file
function save_options_globals()
{
	ini_open("Subhuman.ini");
	ini_write_real("General", "DebugMode", global.debug);
	ini_write_bool("General", "Fullscreen", window_get_fullscreen());
	ini_write_bool("General", "MenuEffectEnabled", global.distortEnabled);
	ini_close();
}
