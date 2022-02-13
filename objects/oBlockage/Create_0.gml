/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

open = false;

function hit(_dmg = undefined)
{
	if (_dmg == undefined || _dmg < requiredDmg)
	{
		show_ui_message("I'm going to need something more powerful", 2.5);
		return;
	}
	
	// Switch to sprite of it opening
	open = true;
}
