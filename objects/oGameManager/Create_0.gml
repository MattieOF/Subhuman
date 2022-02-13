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
	// Save player, initialise state struct
	gameState.playerLoadout = oPlayer.loadout;
	gameState.playerInv = oPlayer.inventory;
	gameState.playerHealth = oPlayer.playerHealth;
	gameState.playerSelectedLoadoutItem = oPlayer.selectedLoadoutItem;
	gameState.droppedItems = array_create(0);
	gameState.weaponPickups = {};
	
	// Save enemies
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
		
	// Save vent covers
	gameState.vents = {};
	with (oVentCover)
		oGameManager.gameState.vents[$ id] = true;
		
	// Save spawn triggers
	gameState.spawnTriggers = {};
	with (oSpawnTrigger)
		oGameManager.gameState.spawnTriggers[$ id] = true;
	
	// Save corrodible blockages
	gameState.corrodibleBlockages = {};
	with (oBlockageCorrodible)
		oGameManager.gameState.corrodibleBlockages[$ id] = image_index;
		
	gameState.siphonorator = undefined;
	with (oSiphonorator)
	{
		var siphonorator = {
			X : x,
			Y : y,
			pX : playerLastX,
			pY : playerLastY,
			hp : enemyHealth
		};
		oGameManager.gameState.siphonorator = siphonorator;
	}
	
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
		
	// Load spawn triggers
	with (oSpawnTrigger)
		if (oGameManager.gameState.spawnTriggers[$ id] != true) instance_destroy(id); 
	
	// Load blockages
	with (oBlockage)
		if (oGameManager.gameState.blockages[$ id]) open_blockage(true);
		
	// Load vents
	with (oVentCover)
		if (oGameManager.gameState.vents[$ id] == undefined) break_vent();
	
	// Load corrodible blockages
	with (oBlockageCorrodible)
	{
		if (oGameManager.gameState.corrodibleBlockages[$ id] == undefined)
			done();
		else
			set_stage(oGameManager.gameState.corrodibleBlockages[$ id]);
	}
	
	// Load siphonorator
	if (gameState.siphonorator != pointer_null && gameState.siphonorator != undefined)
	{
		var siphonorator = gameState.siphonorator;
		var inst = instance_create_layer(siphonorator.X, siphonorator.Y, "Level", oSiphonorator);
		inst.playerLastX = siphonorator.pX;
		inst.playerLastY = siphonorator.pY;
		inst.enemyHealth = siphonorator.hp;
	}
	
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
