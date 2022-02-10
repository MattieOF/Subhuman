// Basic AI - charge at player
if (playerInView)
	mp_potential_step_object(oPlayer.x, oPlayer.y, moveSpeed, oSolid);
else if (playerLastX != pointer_null) // If one has a value, we can assume both do
	mp_potential_step_object(playerLastX, playerLastY, moveSpeed, oSolid);
image_angle = direction;
