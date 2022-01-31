/// @description Insert description here

// Inherit the parent event
event_inherited();

// Create a sprite object, and switch to a trigger sprite
sprite = instance_create_layer(x, y, layer, oSprite);
sprite.solid = true;
sprite.image_speed = 0;
sprite.sprite_index = sprite_index;
lastFrame = sprite_get_number(sprite.sprite_index) - 1;
sprite_index = sTrigger;

function item_used()
{
	used = true;
	sprite.image_speed = 1;
	interactable = false;
}
