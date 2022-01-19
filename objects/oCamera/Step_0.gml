/// @description Follow target

// Increment lerp frames
if (currentLerp < lerpTime) currentLerp++;

if (instance_exists(target)) 
{
	// If the player has moved since the last frame, reset the lerp
	if (prevTargetX != target.x || prevTargetY != target.y) currentLerp = 0;
	
	// Set the target in the middle of the camera
	var targetX = target.x - ((cameraWidth * zoom) / 2);
	var targetY = target.y - ((cameraHeight * zoom) / 2);
	
	// Clamp the target coordinates to not let the camera go outside the room
	targetX = clamp(targetX, 0, room_width - (cameraWidth * zoom));
	targetY = clamp(targetY, 0, room_height - (cameraHeight * zoom));
	
	// Lerp the camera position using out quad easing
	// Don't let the lerped coordinate be any more than 30 units away from the true value
	cameraX = twerp(TwerpType.out_quad, clamp(cameraX, targetX - 30, targetX + 30), targetX, currentLerp / lerpTime);
	cameraY = twerp(TwerpType.out_quad, clamp(cameraY, targetY - 30, targetY + 30), targetY, currentLerp / lerpTime);
	
	// Refresh previous target coordinates
	prevTargetX = target.x;
	prevTargetY = target.y;
}

// Finally, set the cameras position to our newly computed values
camera_set_view_pos(view_camera[0], cameraX, cameraY);
