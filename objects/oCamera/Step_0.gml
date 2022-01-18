/// @description Follow target

if (currentLerp < lerpTime) currentLerp++;

if (instance_exists(target)) 
{
	if (prevTargetX != target.x || prevTargetY != target.y) currentLerp = 0;
	
	var targetX = target.x - ((cameraWidth * zoom) / 2);
	var targetY = target.y - ((cameraHeight * zoom) / 2);
	
	targetX = clamp(targetX, 0, room_width - (cameraWidth * zoom));
	targetY = clamp(targetY, 0, room_height - (cameraHeight * zoom));
	
	cameraX = twerp(TwerpType.out_quad, clamp(cameraX, targetX - 30, targetX + 30), targetX, currentLerp / lerpTime);
	cameraY = twerp(TwerpType.out_quad, clamp(cameraY, targetY - 30, targetY + 30), targetY, currentLerp / lerpTime);
	
	prevTargetX = target.x;
	prevTargetY = target.y;
	
	log_format_string("x: {0}, y: {1}", cameraX, cameraY);
}

camera_set_view_pos(view_camera[0], cameraX, cameraY);
