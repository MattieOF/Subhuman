/// @description Define base functions

inRange = false;
interactable = true;
keycard = pointer_null;

var sprite = instance_create_layer(x, y, layer, oSprite);
sprite.sprite_index = sprite_index;
sprite_index = sTrigger;
image_xscale = 0.4;
image_yscale = 0.4;

function check_item_used(_item)
{
	if (items_equal(_item, item))
	{
		play_sound_if_exists(successSound);
		item_used(_item);
		return true;
	}
	else
	{
		play_sound_if_exists(failSound);
		return false;
	}
}

function item_used(_item)
{
	if (keycard != pointer_null && oPlayer.inventory_full()) return;
	
	if (keycard != pointer_null)
		oPlayer.inventory_add(keycard);
	keycard = _item;
	image_index = image_index == 1 ? 0 : 1;
	requiresItem = !requiresItem;
	
	global.doors[$ doorId].hasKeycard = keycard != pointer_null;
}
