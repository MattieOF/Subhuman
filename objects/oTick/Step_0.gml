/// @description Insert description here
// You can write your code in this editor

if (playerInView)
	mp_potential_step_object(oPlayer.x, oPlayer.y, moveSpeed, oWall);
else if (playerLastX != pointer_null) // If one has a value, we can assume both do
	mp_potential_step_object(playerLastX, playerLastY, moveSpeed, oWall);
image_angle = direction;

if (moveSpeed > 0) moveSpeed -= 0.5;

if (!playerInView) timeSinceLastSawPlayer++;
if (timeSinceLastSawPlayer > 20 * room_speed) retreat();
