/// @description Define base functions

inRange = false;

function check_item_used(_item)
{
	if (_item == item)
	{
		item_used();
		play_sound_if_exists(successSound);
	}
	play_sound_if_exists(failSound);
}

function item_used()
{
	instance_destroy(id);
}
