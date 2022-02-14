/// @description Define init function

function init(_projectile, _dir, _speedFactor)
{
	if (_projectile.sprite != undefined) sprite_index = _projectile.sprite;
	direction = _dir;
	image_angle = direction;
	speed = _projectile.projectileSpeed * _speedFactor;
	projectile = _projectile;
}

function explode()
{
	if (projectile.debrisSprite != undefined) 
		create_debris(x, y, projectile.debrisSprite, 5, 0.5, 0.75, angle_reverse(direction) + 70, angle_reverse(direction) - 70);
	instance_destroy(id);
}
