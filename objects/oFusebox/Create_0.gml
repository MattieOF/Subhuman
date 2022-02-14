/// @description Define base functions

inRange = false;
interactable = true;
hasFuse = false;

var sprite = instance_create_layer(x, y, layer, oSprite);
sprite.sprite_index = sprite_index;
sprite.image_xscale = image_xscale;
sprite.image_yscale = image_yscale;
sprite.image_angle = image_angle;
sprite_index = sTrigger;
image_xscale = 0.4;
image_yscale = 0.4;

function check_item_used(_item)
{
	if (items_equal(_item, item))
	{
		play_sound_if_exists(successSound);
		item_used();
		return true;
	}
	else
	{
		play_sound_if_exists(failSound);
		return false;
	}
}

function item_used()
{
	if (hasFuse && oPlayer.inventory_full()) return;
	
	hasFuse = !hasFuse;
	image_index = image_index == 1 ? 0 : 1;
	requiresItem = !requiresItem;
	if (!hasFuse)
		oPlayer.inventory_add(global.itemFuse);
	
	global.doors[$ doorId].hasFuse = hasFuse;
}
