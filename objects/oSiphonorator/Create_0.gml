/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

moveSpeed = 1.2;

image_xscale = 1.5;
image_yscale = 1.5;

// AI state vars
attackCooldownTime = 2.5 * room_speed;
attackCooldown = 5 * room_speed;

// ----------------
// Attack functions
// ----------------

function throw_goo_ball()
{
	var length = ((sprite_get_width(sprite_index) * image_xscale) / 2) + 5;
	var _x = lengthdir_x(length, direction);
	var _y = lengthdir_y(length, direction);
	
	instance_create_layer(x + _x, y + _y, layer, oGooBall);
	attackCooldown = attackCooldownTime;
}

function summon_tick()
{
	var pos = random_free_point_in_rect(x - 120, y - 120, x + 120, y + 120, oWall);
	instance_create_layer(pos.X, pos.Y, layer, oTickSpawn);
	attackCooldown = attackCooldownTime;
}

function melee()
{
	moveSpeed = 4;
	cast_hitscan(x, y, point_direction(x, y, oPlayer.x, oPlayer.y), global.weaponSiphonoratorMelee,,oPlayer,,false);
	attackCooldown = attackCooldownTime / 2;
}
