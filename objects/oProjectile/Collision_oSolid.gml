/// @description Insert description here
if (projectile.debrisSprite != undefined) 
	create_debris(x, y, projectile.debrisSprite, 5, 0.5, 0.75, angle_reverse(direction) + 70, angle_reverse(direction) - 70);
instance_destroy(id);
