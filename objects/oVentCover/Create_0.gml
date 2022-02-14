/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function break_vent()
{
	audio_play_sound(sndVentCoverHit, 0, false);
	instance_change(oSprite, true);
	sprite_index = sVentCoverBroken;
}

function hit(_dmg)
{
	if (oPlayer.loadout[$ oPlayer.selectedLoadoutItem].weapon.name == "Crowbar")
		break_vent();
	else
		show_ui_message("I'll need a crowbar to break this vent cover", 2.5);
}
