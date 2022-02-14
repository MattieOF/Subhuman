/// @description Define base functions

inRange = false;
interactable = true;
hasFuse = false;

sprite = instance_create_layer(x, y, layer, oSprite);
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

function set_has_fuse(_val)
{
	hasFuse = _val;
	sprite.image_index = _val ? 1 : 0;
	requiresItem = !_val;
	global.doors[$ doorId].hasFuse = _val;
}
set_has_fuse(hasFuseOnStart);

function item_used()
{
	if (hasFuse && oPlayer.inventory_full()) return;
	if (hasFuse)
		oPlayer.inventory_add(global.itemFuse);
	set_has_fuse(!hasFuse);
}
