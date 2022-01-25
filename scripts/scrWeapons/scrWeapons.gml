global.projectileLayer = undefined;
global.projectileObject = oProjectile;

global.testProjectile = new Projectile(sTestProjectile, 10, 5, sTestDebris);

global.weaponFists = new WeaponMelee("Fists", sTestProjectile, 5, 3, 0.75, new WeaponSounds());
global.weaponPistol = new WeaponHitscan("Pistol", sTestProjectile, 10, 2000, 0.05, 0.05, 500, 25, new WeaponSounds());
global.weaponProjectileTest = new WeaponProjectile("Projectile Test", sTestProjectile, global.testProjectile,
	0.25, 1, 15, 60, new WeaponSounds());

enum weaponType
{
	projectile,
	hitscan,
	melee
}

function LoadoutItem(_weapon) constructor
{
	weapon = _weapon;
	if (variable_struct_exists(_weapon, "ammoClip"))
	{
		ammoClip = _weapon.ammoClip;
		ammoReserve = _weapon.ammoReserve;
	}
}

function WeaponSounds(_shoot = undefined, _reload = undefined) constructor
{
	soundShoot = _shoot;
	soundReload = _reload;
}

function WeaponHitscan(_name, _sprite, _damage, _range, _rof, _reloadTime, _clip, _reserve, _sounds) constructor
{
	type = weaponType.hitscan;
	name = _name;
	if (!sprite_exists(_sprite)) log_format_string("In weapon {0}, provided sprite doesn't exist.", _name);
	else sprite = _sprite;
	damage = _damage;
	range = _range;
	rof = _rof;
	reloadTime = _reloadTime;
	ammoClip = _clip;
	ammoReserve = _reserve;
	if (!variable_struct_exists(_sounds, "reload")) 
		log_format_string("In weapon {0}, provided WeaponSounds is invalid.", _name);
	else sounds = _sounds;
}

function WeaponProjectile(_name, _sprite, _projectile, _rof, _reloadTime, _clip, _reserve, _sounds) constructor
{
	type = weaponType.projectile;
	name = _name;
	if (!sprite_exists(_sprite)) log_format_string("In weapon {0}, provided sprite doesn't exist.", _name);
	else sprite = _sprite;
	projectile = _projectile;
	rof = _rof;
	reloadTime = _reloadTime;
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

function Projectile(_sprite, _damage, _speed, _debrisSprite = undefined) constructor
{
	if (!sprite_exists(_sprite)) log_format_string("In a projectile, provided sprite ({0}) doesn't exist.", _sprite);
	else sprite = _sprite;
	damage = _damage;
	projectileSpeed = _speed;
	debrisSprite = _debrisSprite;
}

function create_projectile(_x, _y, _projectile, _dir)
{
	if (global.projectileLayer == undefined || !layer_exists(global.projectileLayer)) global.projectileLayer = layer_create(-500, "Projectiles");
	var proj = instance_create_layer(_x, _y, global.projectileLayer, global.projectileObject);
	proj.init(_projectile, _dir, 1);
}

function cast_hitscan(_x, _y, _dir, _weapon, _wall = oSolid, _enemy = oEnemy, _tracer = true)
{
	info = raycast(_x, _y, _dir, _weapon.range, _wall);
	var endX = info.X;
	var endY = info.Y;
	
	enemyInfo = raycast(_x, _y, _dir, _weapon.range, _enemy);
	var wallDist  = point_distance(_x, _y, info.X, info.Y);
	var enemyDist = point_distance(_x, _y, enemyInfo.X, enemyInfo.Y);
	if (enemyDist < wallDist)
	{
		// We hit an enemy before a wall
		endX = enemyInfo.X;
		endY = enemyInfo.Y;
		instance_destroy(enemyInfo.obj);
		create_debris(endX, endY, sBloodParticle, 8, 2, 0.4);
	}
	
	delete info;
	delete enemyInfo;
	if (_tracer) create_tracer(_x, _y, endX, endY);
}
