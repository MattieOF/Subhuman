/// @description Define base functions

inRange = false;
interactable = true;

function check_item_used(_item)
{
	if (items_equal(_item, item))
	{
		play_sound_if_exists(successSound);
		item_used();
	}
	else
		play_sound_if_exists(failSound);
}

function item_used()
{
	instance_destroy(id);
}
