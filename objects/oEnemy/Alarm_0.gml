/// @description Check for LOS to player

if (collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true) == noone)
{
	show_debug_message("I see u");
	playerInView = true;
	playerLastX = oPlayer.x;
	playerLastY = oPlayer.y;
}
else
{
	show_debug_message("Can't see!");
	playerInView = false;
}

alarm[0] = sightCheckTimer * room_speed;
