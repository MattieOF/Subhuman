// Create sprite object on the same layer
playerSprite = instance_create_layer(x, y, layer, oSprite);
playerSprite.sprite_index = sPlayerNormal;
playerSprite.image_xscale = 1.5;
playerSprite.image_yscale = 1.5;

// Get layer ids
hurtEffectLayer = layer_get_id("HurtEffect");

playerHealth = 100;
loadout = {};
selectedLoadoutItem = 0;
shootCooldown = 0;
overhealTickTime = 0.5 * room_speed;
currentOverhealTickTime = 0;

// If reloadTime is 0 and reloading is true, reload ammo.
reloading = false;
reloadTime = 0;

function update_loadout_size()
{
	loadoutSize = 0;
	while (loadout[$loadoutSize] != undefined) loadoutSize++;
}

loadout[$ 0] = new LoadoutItem(global.weaponFists);
if (global.debug) loadout[$ 1] = new LoadoutItem(global.weaponDebug);
if (global.debug) loadout[$ 2] = new LoadoutItem(global.weaponCrowbar);
if (global.debug) loadout[$ 3] = new LoadoutItem(global.weaponProjectileTest);
if (global.debug) loadout[$ 4] = new LoadoutItem(global.weaponShotgun);
if (global.debug) loadout[$ 5] = new LoadoutItem(global.weaponAssaultRifle);
selectedLoadoutItem = 0;
update_loadout_size();

// Initialise inventory
inventorySlots = 10;
inventory = array_create(inventorySlots, pointer_null);

function inventory_full()
{
	for (var i = 0; i < inventorySlots; i++)
		if (inventory[i] == pointer_null) return false;
	return true;
}

function inventory_add(item)
{
	if (inventory_full()) return false;
	
	for (var i = 0; i < inventorySlots; i++)
	{
		if (inventory[i] == pointer_null) 
		{
			inventory[i] = item;
			return true;
		}
	}
	return false;
}

function inventory_remove_index(index)
{
	if (index < 0 || index >= inventorySlots) return;
	inventory[index] = pointer_null;
}

function inventory_remove_item(item)
{
	for (var i = 0; i < inventorySlots; i++)
	{
		if (inventory[i] == item) 
		{
			inventory[i] = pointer_null;
			return true;
		}
	}
	return false;
}

function shoot()
{
	// Return if we can't shoot right now
	if (reloading) return; // Currently reloading
	if (selectedLoadoutItem == -1) return; // No valid weapon selected
	if (shootCooldown > 0) return; // On shoot cooldown
	if (!loadout[$selectedLoadoutItem].weapon.auto && !control_check_pressed(controls.attackPrimary)) return; // Non auto weapon, but we're holding the button
	
	// Get direction to fire weapon
	var dir = point_direction(x, y, mouse_x, mouse_y); // Or we could use image_angle?
	
	switch (loadout[$selectedLoadoutItem].weapon.type)
	{
		case weaponType.melee:
			cast_hitscan(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), dir, loadout[$selectedLoadoutItem].weapon,oWall,oHittable,oHittableSolid,false);
			play_sound_if_exists(loadout[$selectedLoadoutItem].weapon.sounds.soundShoot, 1, false);
			shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
			break;
		case weaponType.hitscan:
			if (loadout[$selectedLoadoutItem].ammoClip <= 0) 
			{
				audio_play_sound(sndDryfire, 0, false);
				shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
				return;
			}
			
			repeat (loadout[$selectedLoadoutItem].weapon.shots)
			{
				var spread = loadout[$selectedLoadoutItem].weapon.spread;
				var shotDir = dir + random_range(-spread, spread);
				cast_hitscan(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), shotDir, loadout[$selectedLoadoutItem].weapon);
			}
			
			
			play_sound_if_exists(loadout[$selectedLoadoutItem].weapon.sounds.soundShoot, 1, false);
			shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
			loadout[$selectedLoadoutItem].ammoClip--;
			break;
		case weaponType.projectile:
			if (loadout[$selectedLoadoutItem].ammoClip <= 0) 
			{
				audio_play_sound(sndDryfire, 0, false);
				shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
				return;
			}
			
			var spread = loadout[$selectedLoadoutItem].weapon.spread;
			var shotDir = dir + random_range(-spread, spread);
			play_sound_if_exists(loadout[$selectedLoadoutItem].weapon.sounds.soundShoot, 1, false);
			create_projectile(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), loadout[$selectedLoadoutItem].weapon.projectile, shotDir);
			shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
			loadout[$selectedLoadoutItem].ammoClip--;
			break;
	}
}

function reload_pressed()
{
	// Return if we can't reload
	if (reloading) return; // Already reloading
	if (!variable_struct_exists(loadout[$selectedLoadoutItem], "ammoClip")) return; // Ammoless weapon
	if (loadout[$selectedLoadoutItem].ammoClip == loadout[$selectedLoadoutItem].weapon.ammoClip) 
		return;  // Clip is full
	if (loadout[$selectedLoadoutItem].ammoReserve == 0) return; // Out of reserve ammo
	
	play_sound_if_exists(loadout[$selectedLoadoutItem].weapon.sounds.soundReload, 1, false);
	
	reloading = true;
	reloadTime = loadout[$selectedLoadoutItem].weapon.reloadTime * room_speed;
}

function reload()
{
	var needed = loadout[$selectedLoadoutItem].weapon.ammoClip - loadout[$selectedLoadoutItem].ammoClip;
	var toBeAdded = min(loadout[$selectedLoadoutItem].ammoReserve, needed);
	
	loadout[$selectedLoadoutItem].ammoClip += toBeAdded;
	loadout[$selectedLoadoutItem].ammoReserve -= toBeAdded;
}

function next_weapon()
{
	if (loadoutSize == 0)
	{
		selectedLoadoutItem = -1;
		return;
	}
	
	selectedLoadoutItem++;
	if (loadout[$selectedLoadoutItem] == undefined) selectedLoadoutItem = 0;
	
	if (reloading)
	{
		reloading = false;
		reloadTime = 0;
	}
	
	oHUD.open_loadout_ui();
}

function previous_weapon()
{
	if (loadoutSize == 0)
	{
		selectedLoadoutItem = -1;
		return;
	}
	
	selectedLoadoutItem--;
	if (loadout[$selectedLoadoutItem] == undefined) selectedLoadoutItem = loadoutSize - 1;
	
	if (reloading)
	{
		reloading = false;
		reloadTime = 0;
	}
	
	oHUD.open_loadout_ui();
}

function set_loadout(_loadout)
{
	loadout = _loadout;
	update_loadout_size();
}

function heal(_health)
{
	playerHealth += _health;
}

function set_hurt_effect(value)
{
	var effect = layer_get_fx(hurtEffectLayer);
	if (effect != -1)
		fx_set_parameter(effect, "g_Radius", value);
}

function tick_hurt_effect()
{
	var effect = layer_get_fx(hurtEffectLayer);
	if (effect != -1)
	{
		var val = fx_get_parameter(effect, "g_Radius");
		if (val > 0)
			fx_set_parameter(effect, "g_Radius", max(val - 0.15, 0));
	}
}

function hurt(_dmg)
{
	set_hurt_effect(2.5);
	playerHealth -= _dmg;
	if (playerHealth <= 0) die();
}

function die()
{
	// Play die sound
	global.gameOverSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
	surface_copy(global.gameOverSurface, 0, 0, application_surface);
	room_goto(rmGameOver);
}

function hit(_dmg = undefined)
{
	hurt(_dmg);
}

function add_weapon(_weapon, _equip = true, _clip = undefined, _reserve = undefined)
{
	var index = 0;
	while (loadout[$ index] != undefined) index++;
	loadout[$ index] = new LoadoutItem(_weapon);
	if (_clip != undefined)
		loadout[$ index].ammoClip = _clip;
	if (_reserve != undefined)
		loadout[$ index].ammoReserve = _reserve;
	update_loadout_size();
	
	if (_equip) 
	{
		selectedLoadoutItem = index;
		
		if (reloading)
		{
			reloading = false;
			reloadTime = 0;
		}
		
		oHUD.open_loadout_ui();
	}
}

// Create hud
instance_create_layer(0, 0, layer_create(-300, "HUD"), oHUD).init(id);
instance_create_layer(0, 0, layer_create(-300, "Crosshair"), oCrosshair).init(id);
instance_create_layer(0, 0, layer_create(-300, "Instances"), oInventoryUI).init(id);
window_set_cursor(cr_none);

if (global.debug) inventory_add(global.itemKeycardLvl1);
if (global.debug) inventory_add(global.itemKeycardLvl2);
if (global.debug) inventory_add(global.itemKeycardLvl5);
if (global.debug) inventory_add(global.itemFuse);
if (global.debug) inventory_add(global.itemFuse);
