/// @description Insert description here
// You can write your code in this editor

if (interactable && inRange && control_check_pressed(controls.save))
{
	if (open)
	{
		interactable = false;
		sprite.image_speed = -1;
	}
	else if (requiresItem) oInventoryUI.open_inventory(id, consumeItem);
	else item_used();
}

if (sprite.image_speed == 1 && sprite.image_index == lastFrame) 
{
	interactable = true;
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
