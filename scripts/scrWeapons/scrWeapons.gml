global.projectileLayer = undefined;
global.projectileObject = oProjectile;

global.testProjectile = new Projectile(sTestProjectile, 25, 5, sTestDebris);

global.weaponFists = new WeaponMelee("Fists", sTestProjectile, 15, 20, 0.75, new WeaponSounds());
global.weaponCrowbar = new WeaponMelee("Crowbar", sTestProjectile, 15, 30, 0.5, new WeaponSounds());
global.weaponPistol = new WeaponHitscan("Pistol", sTestProjectile, 20, 1000, 0.5, 1.2, 10, 45, new WeaponSounds());
global.weaponDebug = new WeaponHitscan("Debug Weapon", sTestProjectile, 1000, 2000, 0.05, 0.05, 500, 25, new WeaponSounds());
global.weaponProjectileTest = new WeaponProjectile("Projectile Test", sTestProjectile, global.testProjectile,
	0.25, 1, 15, 60, new WeaponSounds());
global.weaponSiphonoratorMelee = new WeaponMelee("Siphonorator Melee", sTestProjectile, 25, 60, 0.75, new WeaponSounds());

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

function cast_hitscan(_x, _y, _dir, _weapon, _wall = oWall, _enemy = oHittable, _enemySolid = oHittableSolid, _tracer = true)
{
	var info = raycast(_x, _y, _dir, _weapon.range, _wall);
	var endX = info.X;
	var endY = info.Y;
	
	var enemyInfo = raycast(_x, _y, _dir, _weapon.range, _enemy);
	var solidEnemyInfo = raycast(_x, _y, _dir, _weapon.range, _enemySolid);
	var wallDist  = point_distance(_x, _y, info.X, info.Y);
	var enemyDist = point_distance(_x, _y, enemyInfo.X, enemyInfo.Y);
	var solidEnemyDist = point_distance(_x, _y, solidEnemyInfo.X, solidEnemyInfo.Y);
	var closest = min(wallDist, enemyDist, solidEnemyDist);
	
	if (closest == enemyDist || closest == solidEnemyDist)
	{
		// We hit an enemy before a wall
		var _enemyInfo = (closest == enemyDist ? enemyInfo : solidEnemyInfo);
		
		if (instance_exists(_enemyInfo.obj)) // Occasionally, enemyInfo.obj is invalid and causes a crash.
		{
			_enemyInfo.obj.hit(_weapon.damage);
		}
		
		endX = _enemyInfo.X;
		endY = _enemyInfo.Y;
	}
	
	delete info;
	delete enemyInfo;
	delete solidEnemyInfo;
	if (_tracer) create_tracer(_x, _y, endX, endY);
}
