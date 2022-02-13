/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

open = false;
opening = false;

function hit(_dmg = undefined)
{
	if (open) return;
	
	if (_dmg == undefined || _dmg < requiredDmg)
	{
		show_ui_message("I'm going to need something more powerful", 2.5);
		return;
	}
	
	open_blockage(false);
}

function open_blockage(_instant = false)
{
	if (_instant)
	{
		open = true;
		opening = false;
		sprite_index = sBlockageOpen;
	} 
	else
	{
		open = true;
		opening = true;
		sprite_index = sBlockageOpening;
		image_index = 0;
	}
}
