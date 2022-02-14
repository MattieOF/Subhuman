/// @description Slightly home in on player
if (instance_exists(oPlayer) && instance_exists(oSiphonorator))
{
	var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	var angleDir = dsin(dir - direction);
	
	direction += sign(angleDir) * turnSpeed;
	
	turnSpeed += oSiphonorator.vulnerable ? 0.015 : 0.008;
}

image_angle = direction;
