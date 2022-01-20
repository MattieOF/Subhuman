// Create sprite object on the same layer
playerSprite = instance_create_layer(x, y, layer, oSprite);
playerSprite.sprite_index = sPlayer;

loadout = {};
selectedLoadoutItem = -1;
shootCooldown = 0;

loadout[$ 0] = new LoadoutItem(global.weaponFists);
loadout[$ 1] = new LoadoutItem(global.weaponPistol);

function shoot()
{
	if (selectedLoadoutItem == -1) return;
	if (shootCooldown > 0) return;
		
}
