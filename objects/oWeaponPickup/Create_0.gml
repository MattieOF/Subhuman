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

function init(_weapon)
{
	weapon = _weapon;
	sprite = instance_create_layer(x, y, layer, oSprite);
	sprite.sprite_index = weapon.sprite;
}

function pickup()
{
	oPlayer.add_weapon(weapon, true, clipOverride, reserveOverride);
	instance_destroy(sprite);
	pickupable = false;
	uiState = 1;
}
