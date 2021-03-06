/// @description Insert description here

inRange = false;
pickupable = true;

bgAnimTime = 0.25 * room_speed;
textTime = 1 * room_speed;
fullExtent = 30;
currentBGAnim = 0;
currentTextTime = 0;

/*
0 = none
1 = animate background
2 = show text
3 = animate background reverse
*/
uiState = 0;

sprite = instance_create_layer(x, y, layer, oSprite);
sprite.sprite_index = sprite_index;
sprite.image_xscale = image_xscale;
sprite.image_yscale = image_yscale;
sprite.image_angle = image_angle;
sprite_index = sTrigger;

function pickup()
{
	if (!instance_exists(oSiphonorator)) return;
	oSiphonorator.vulnerable = true;
	
	var name = oGameManager.finalWeapon == 0 ? global.weaponShotgun.name : global.weaponAssaultRifle.name;
	var index = 0;
	while (index < oPlayer.loadoutSize)
	{
		if (oPlayer.loadout[$ index].weapon.name == name)
		{
			var wpn = oGameManager.finalWeapon == 0 ? global.weaponShotgun : global.weaponAssaultRifle;
			oPlayer.loadout[$ index].ammoClip = wpn.ammoClip;
			oPlayer.loadout[$ index].ammoReserve = wpn.ammoReserve;
			break;
		}
		index++;
	}
	
	instance_destroy(sprite);
	pickupable = false;
	// Start animating
	currentBGAnim = 0;
	uiState = 1;
}
