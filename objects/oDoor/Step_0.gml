/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (sprite.image_speed == 1 && sprite.image_index == lastFrame) 
{
	sprite.image_speed = 0;
	if (timeOpen > 0) alarm[0] = timeOpen * room_speed;
}
else 
{
	if (sprite.image_speed == -1 && sprite.image_index < 1) 
	{
		// Make door openable again
		open = false;
		interactable = true;
		requiresItem = false;
		sprite.image_speed = 0;
	}
}
