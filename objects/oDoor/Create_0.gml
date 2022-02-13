/// @description Insert description here

// Inherit the parent event
event_inherited();

// Create a sprite object, and switch to a trigger sprite
sprite = instance_create_layer(x, y, layer, oSolidSprite);
sprite.image_speed = 0;
sprite.sprite_index = sprite_index;
sprite.image_xscale = image_xscale;
sprite.image_yscale = image_yscale;
sprite.image_angle = image_angle;
lastFrame = sprite_get_number(sprite.sprite_index) - 1;
sprite_index = sTrigger;

function item_used()
{
	open = true;
	interactable = false;
	sprite.image_speed = 1;
}
