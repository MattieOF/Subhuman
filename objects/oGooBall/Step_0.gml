/// @description Slightly home in on player
if (instance_exists(oPlayer))
{
	var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	var angleDir = dsin(dir - direction);
	
	direction += sign(angleDir) * turnSpeed;
}

image_angle = direction;
turnSpeed += 0.008;
