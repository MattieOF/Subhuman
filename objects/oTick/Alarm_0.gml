/// @description Check for LOS to player

if (collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true) == noone)
{
	playerInView = true;
	playerLastX = oPlayer.x;
	playerLastY = oPlayer.y;
}
else
{
	playerInView = false;
}

alarm[0] = sightCheckTimer * room_speed;
