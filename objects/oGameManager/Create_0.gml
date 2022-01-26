/// @description Function defs

// Initialise game state struct
gameState = 
{
	playerScore : 0,
	currentSaveLoc : "",
	enemies : {}
}

// Initialise save locations struct
saveLocations = 
{
}

alarm[0] = 1;

function save(filename = "savegame.json")
{
	var keys = variable_struct_get_names(gameState.enemies);
	for (var i = array_length(keys) - 1; i >= 0; --i) 
	{
	    var k = keys[i];
	    var v = gameState.enemies[$ k];
		if (v != undefined || v != 0 || v != pointer_null)
		{
			with (k)
			{
				global.tempHealth = enemyHealth;
				global.tempX = x;
				global.tempY = y;
			}
			gameState.enemies[$ k].enemyHealth = global.tempHealth;
			gameState.enemies[$ k].X = global.tempX;
			gameState.enemies[$ k].Y = global.tempY;
		}
	}
	gameState.playerLoadout = oPlayer.loadout;
	gameState.playerSelectedLoadoutItem = oPlayer.selectedLoadoutItem;
	
	if (file_exists(filename)) file_delete(filename);
	
	var file = file_text_open_write(filename);
	file_text_write_string(file, json_stringify(gameState));
	file_text_close(file);
}

function load(filename = "savegame.json")
{
	if (!file_exists(filename))
	{
		save(filename);
		return;
	}
	
	var file = file_text_open_read(filename);
	gameState = json_parse(file_text_read_string(file));
	file_text_close(file);
	
	// Set player position to current save locs location
	oPlayer.x = saveLocations[$ gameState.currentSaveLoc].x;
	oPlayer.y = saveLocations[$ gameState.currentSaveLoc].y;
	
	// Setup player loadout
	oPlayer.set_loadout(gameState.playerLoadout);
	oPlayer.selectedLoadoutItem = gameState.playerSelectedLoadoutItem;
	
	// Loop through loaded enemies, set their position and health
	var keys = variable_struct_get_names(gameState.enemies);
	for (var i = array_length(keys) - 1; i >= 0; --i) 
	{
	    var k = keys[i];
	    var v = gameState.enemies[$ k];
		if (v == 0 || v == pointer_null) // Enemy is dead
		{
			instance_destroy(k);	
		}
		else
		{
			with (k)
			{
				enemyHealth = v.enemyHealth;
				x = v.X;
				y = v.Y;
			}
		}
	}
}
