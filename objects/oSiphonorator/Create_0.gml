/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = 2;
image_yscale = 2;

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
	var length = ((sprite_get_width(sprite_index) * image_xscale) / 2) + 10;
	var _x = lengthdir_x(length, direction);
	var _y = lengthdir_y(length, direction);
	
	instance_create_layer(x + _x, y + _y, layer, oTickSpawn);
	attackCooldown = attackCooldownTime;
}

function melee()
{
	
}
