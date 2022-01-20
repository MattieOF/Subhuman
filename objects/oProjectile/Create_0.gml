/// @description Define init function

function init(_projectile, _dir, _speedFactor)
{
	if (_projectile.sprite != undefined) sprite_index = _projectile.sprite;
	direction = _dir;
	speed = _projectile.projectileSpeed * _speedFactor;
	projectile = _projectile;
}
