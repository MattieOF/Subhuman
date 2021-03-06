/// @description Define base functions

inRange = false;
interactable = true;
open = false;

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
	open = true;
	instance_destroy(id);
}
