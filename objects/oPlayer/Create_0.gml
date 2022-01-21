// Create sprite object on the same layer
playerSprite = instance_create_layer(x, y, layer, oSprite);
playerSprite.sprite_index = sPlayer;

loadout = {};
selectedLoadoutItem = 0;
shootCooldown = 0;

function update_loadout_size()
{
	loadoutSize = 0;
	while (loadout[$loadoutSize] != undefined) loadoutSize++;
}

loadout[$ 0] = new LoadoutItem(global.weaponFists);
loadout[$ 1] = new LoadoutItem(global.weaponPistol);
loadout[$ 2] = new LoadoutItem(global.weaponProjectileTest);
update_loadout_size();

function shoot()
{
	if (selectedLoadoutItem == -1) return;
	if (shootCooldown > 0) return;
		
	switch (loadout[$selectedLoadoutItem].weapon.type)
	{
		case weaponType.melee:
			show_debug_message("melee");
			break;
		case weaponType.hitscan:
			show_debug_message("hitscan");
			break;
		case weaponType.projectile:
			show_debug_message("projectile");
			break;
	}
}

// Create hud
instance_create_layer(0, 0, layer_create(-300, "HUD"), oHUD).init(id);
