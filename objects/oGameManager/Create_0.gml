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
		if (v != undefined && v != 0 && v != pointer_null)
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
	gameState.playerInv = oPlayer.inventory;
	gameState.playerHealth = oPlayer.playerHealth;
	gameState.playerSelectedLoadoutItem = oPlayer.selectedLoadoutItem;
	gameState.droppedItems = array_create(0);
	gameState.weaponPickups = {};
	
	// Save items
	with (oItem)
	{
		if (pickupable)
		{
			var itemObject = 
			{
				itemInfo : item,
				X : x,
				Y : y
			}
			array_push(oGameManager.gameState.droppedItems, itemObject);
		}
	}
	
	// Save weapon pickups
	with (oWeaponPickup)
	{
		if (pickupable)
			oGameManager.gameState.weaponPickups[$ id] = true;
	}
	
	// Save usables
	gameState.usables = {};
	with (oUsable)
	{
		oGameManager.gameState.usables[$ id] = {
			needsItem : requiresItem,
			interactable : interactable,
			open : open
		};
	}
	
	// Save breakables
	gameState.breakables = {};
	with (oBreakable)
	{
		oGameManager.gameState.breakables[$ id] = true;
	}
	
	// Save blockages
	gameState.blockages = {};
	with (oBlockage)
		oGameManager.gameState.blockages[$ id] = open;
	
	// Save ticks
	gameState.ticks = array_create(0);
	with (oTick)
	{
		var tick = {
			X : x,
			Y : y,
			pX : playerLastX,
			pY : playerLastY
		};
		array_push(oGameManager.gameState.ticks, tick);
	}
	
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
	
	// Set player health
	oPlayer.playerHealth = max(gameState.playerHealth, 1);
	
	// Setup player loadout
	oPlayer.set_loadout(gameState.playerLoadout);
	oPlayer.selectedLoadoutItem = gameState.playerSelectedLoadoutItem;
	oPlayer.inventory = gameState.playerInv;
	
	// Reload dropped items
	for (var i = 0; i < array_length(gameState.droppedItems); i++)
	{
		var current = gameState.droppedItems[i];
		instance_create_layer(current.X, current.Y, "Level", oItem).init(current.itemInfo);
	}
	
	// Reload weapon pickups
	// If dynamic weapon pickups are needed, do something similar to how we save items
	// Have a boolean in the pickup called "dynamic" that we can set to true if it was
	// dropped at runtime and is not part of the level. If it's true, execute the code
	// similar to how we save items, otherwise use this method.
	with (oWeaponPickup) 
	{
		if (oGameManager.gameState.weaponPickups[$ id] == undefined)
		{
			instance_destroy(sprite);
			instance_destroy(id);
		}
	}
	
	// Load usables
	with (oUsable)
	{
		var val = oGameManager.gameState.usables[$ id];
		if (val == undefined) instance_destroy();
		else 
		{
			requiresItem = val.needsItem;
			interactable = val.interactable;
			if (val.open) item_used();
		}
	}
	
	// Load breakables
	with (oBreakable)
		if (oGameManager.gameState.breakables[$ id] != true) instance_destroy(id); 
		
	// Load blockages
	with (oBlockage)
		if (oGameManager.gameState.blockages[$ id]) open_blockage(true);
		
	// Load ticks
	for (var i = 0; i < array_length(gameState.ticks); i++)
	{
		var current = gameState.ticks[i];
		var tick = instance_create_layer(current.X, current.Y, "Level", oTick);
		tick.playerLastX = current.pX;
		tick.playerLastY = current.pY;
	}
	
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
