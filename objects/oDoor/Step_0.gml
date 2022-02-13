/// @description Insert description here
// You can write your code in this editor

if (needsFuse)
	interactable = hasFuse;
if (needsKeycard)
	interactable = hasKeycard;
	
if (open && ((needsFuse && !hasFuse) || (needsKeycard && !hasKeycard)))
	alarm[0] = 1;

if (interactable && inRange && control_check_pressed(controls.save))
{
	if (open)
	{
		interactable = false;
		sprite.image_speed = -1;
		sprite.mask_index = doorSprite;
	}
	else if (requiresItem) oInventoryUI.open_inventory(id, consumeItem);
	else item_used();
}

if (sprite.image_speed == 1 && sprite.image_index == lastFrame) 
{
	interactable = true;
	sprite.image_speed = 0;
	sprite.mask_index = sEmpty;
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
		sprite.mask_index = doorSprite;
	}
}
