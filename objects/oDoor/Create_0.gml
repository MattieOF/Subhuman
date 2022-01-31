/// @description Insert description here

// Inherit the parent event
event_inherited();

// Create a sprite object, and switch to a trigger sprite
sprite = instance_create_layer(x, y, layer, oSprite);
sprite.sprite_index = sprite_index;
sprite_index = sTrigger;

function item_used()
{
	show_debug_message("override!");
	sprite.sprite_index = sEnemy;
	interactable = false;
}
