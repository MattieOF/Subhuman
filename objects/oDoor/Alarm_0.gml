/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, oPlayer) || place_meeting(x, y, oSiphonorator))
{
	alarm[0] = 1;
	return;
}

interactable = false;
sprite.image_speed = -1;
sprite.mask_index = doorSprite;
