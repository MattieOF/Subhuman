// Basic AI - charge at player
if (playerInView)
	mp_potential_step_object(oPlayer.x, oPlayer.y, 1.5, oSolid);
else if (playerLastX != undefined) // If one has a value, we can assume both do
	mp_potential_step_object(playerLastX, playerLastY, 1.5, oSolid);
image_angle = direction;
