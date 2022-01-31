// Create sprite object on the same layer
playerSprite = instance_create_layer(x, y, layer, oSprite);
playerSprite.sprite_index = sPlayer;

loadout = {};
selectedLoadoutItem = 0;
shootCooldown = 0;

// If reloadTime is 0 and reloading is true, reload ammo.
reloading = false;
reloadTime = 0;

function update_loadout_size()
{
	loadoutSize = 0;
	while (loadout[$loadoutSize] != undefined) loadoutSize++;
}

loadout[$ 0] = new LoadoutItem(global.weaponFists);
loadout[$ 1] = new LoadoutItem(global.weaponPistol);
loadout[$ 2] = new LoadoutItem(global.weaponProjectileTest);
selectedLoadoutItem = 2;
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
	
	// Get direction to fire weapon
	var dir = point_direction(x, y, mouse_x, mouse_y); // Or we could use image_angle?
	
	switch (loadout[$selectedLoadoutItem].weapon.type)
	{
		case weaponType.melee:
			cast_hitscan(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), dir, loadout[$selectedLoadoutItem].weapon,,,false);
			shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
			break;
		case weaponType.hitscan:
			if (loadout[$selectedLoadoutItem].ammoClip <= 0) return;
			
			cast_hitscan(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), dir, loadout[$selectedLoadoutItem].weapon);
			
			shootCooldown = loadout[$selectedLoadoutItem].weapon.rof * room_speed;
			loadout[$selectedLoadoutItem].ammoClip--;
			break;
		case weaponType.projectile:
			if (loadout[$selectedLoadoutItem].ammoClip <= 0) return;
			create_projectile(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), loadout[$selectedLoadoutItem].weapon.projectile, dir);
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

// Create hud
instance_create_layer(0, 0, layer_create(-300, "HUD"), oHUD).init(id);
instance_create_layer(0, 0, layer_create(-300, "Crosshair"), oCrosshair).init(id);
instance_create_layer(0, 0, layer_create(-300, "Instances"), oInventoryUI).init(id);
window_set_cursor(cr_none);

inventory_add(global.item_test);
inventory_add(global.item_test);
inventory_add(global.item_test);
inventory_add(global.item_test);
