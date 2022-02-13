/// @description AI

if (latched)
{
	x = oPlayer.x + lengthdir_x(playerOffsetLength, playerOffset);
	y = oPlayer.y + lengthdir_y(playerOffsetLength, playerOffset);
	return;
}

if (playerInView)
	mp_potential_step_object(oPlayer.x, oPlayer.y, moveSpeed, oWall);
else if (playerLastX != pointer_null) // If one has a value, we can assume both do
	mp_potential_step_object(playerLastX, playerLastY, moveSpeed, oWall);
image_angle = direction;

if (moveSpeed > 0) moveSpeed -= 0.5;

if (!playerInView) timeSinceLastSawPlayer++;
else timeSinceLastSawPlayer = 0;
if (timeSinceLastSawPlayer > 15 * room_speed) retreat();
