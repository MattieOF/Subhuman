global.projectileLayer = undefined;
global.projectileObject = oProjectile;

global.testProjectile = new Projectile(sTestProjectile, 10, 5);

enum weaponType
{
	projectile,
	hitscan,
	melee
}

function WeaponSounds(_shoot, _reload) constructor
{
	shoot = _shoot;
	reload = _reload;
}

function WeaponHitscan(_name, _sprite, _damage, _range, _rof, _clip, _reserve, _sounds) constructor
{
	type = weaponType.hitscan;
	name = _name;
	if (!sprite_exists(_sprite)) log_format_string("In weapon {0}, provided sprite doesn't exist.", _name);
	else sprite = _sprite;
	damage = _damage;
	range = _range;
	rof = _rof;
	ammoClip = _clip;
	ammoReserve = _reserve;
	if (!variable_struct_exists(_sounds, "reload")) 
		log_format_string("In weapon {0}, provided WeaponSounds is invalid.", _name);
	else sounds = _sounds;
}

function WeaponProjectile(_name, _sprite, _projectile, _rof, _clip, _reserve, _sounds) constructor
{
	type = weaponType.projectile;
	name = _name;
	if (!sprite_exists(_sprite)) log_format_string("In weapon {0}, provided sprite doesn't exist.", _name);
	else sprite = _sprite;
	projectile = _projectile;
	rof = _rof;
	ammoClip = _clip;
	ammoReserve = _reserve;
	if (!variable_struct_exists(_sounds, "reload")) 
		log_format_string("In weapon {0}, provided WeaponSounds is invalid.", _name);
	else sounds = _sounds;
}

function WeaponMelee(_name, _sprite, _damage, _range, _rof, _sounds) constructor
{
	type = weaponType.melee;
	name = _name;
	if (!sprite_exists(_sprite)) log_format_string("In weapon {0}, provided sprite doesn't exist.", _name);
	else sprite = _sprite;
	damage = _damage;
	range = _range;
	rof = _rof;
	if (!variable_struct_exists(_sounds, "reload")) 
		log_format_string("In weapon {0}, provided WeaponSounds is invalid.", _name);
	else sounds = _sounds;
}

function Projectile(_sprite, _damage, _speed) constructor
{
	if (!sprite_exists(_sprite)) log_format_string("In a projectile, provided sprite ({0}) doesn't exist.", _sprite);
	else sprite = _sprite;
	damage = _damage;
	projectileSpeed = _speed;
}

function create_projectile(_x, _y, _projectile, _dir)
{
	if (global.projectileLayer == undefined) global.projectileLayer = layer_create(-500, "Projectiles");
	var proj = instance_create_layer(_x, _y, global.projectileLayer, global.projectileObject);
	proj.init(_projectile, _dir, 1);
}
