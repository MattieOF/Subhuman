/// @description Insert description here
if (projectile.debrisSprite != undefined) 
	create_debris(x, y, projectile.debrisSprite, 5, 1, 2, angle_reverse(direction) + 50, angle_reverse(direction) - 50);
instance_destroy(id);
