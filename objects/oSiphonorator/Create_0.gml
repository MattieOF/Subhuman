/// @description Insert description here
// You can write your code in this editor

mp_potential_settings(270, 60, 15, true);

// -------------
// AI state vars
// -------------
playerLastX = pointer_null;
playerLastY = pointer_null;
playerInView = false;
path = undefined;
vulnerable = false;

// Start sight check alarm
alarm[0] = 1;

// --------------------
// Function definitions
// --------------------
function hurt(_dmg)
{
	if (_dmg == undefined) return;
	create_debris(x, y, sBloodParticle, 8, 2, 0.4);
	if (vulnerable) enemyHealth -= _dmg;
	if (enemyHealth <= 0)
		die();
}

function die()
{
	instance_create_layer(x, y, layer, oItem).init(global.itemKeycardLvl5);
	instance_destroy(id);
	oGameManager.gameState.playerScore += value;
	oGameManager.gameState.enemies[$ id] = undefined;
}

function hit(_dmg = undefined)
{
	hurt(_dmg);
}

function compute_path()
{
	if (path != undefined) path_delete(path);
	path = path_add();
	
	if (!playerInView && playerLastX == pointer_null)
	{
		playerLastX = x;
		playerLastY = y;
	}
	
	mp_potential_path_object(path, playerInView ? oPlayer.x : playerLastX, playerInView ? oPlayer.y : playerLastY, moveSpeed, 4, oSolid);
	path_start(path, moveSpeed, path_action_stop, true);
}

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
	audio_play_sound(sndSwing, 0, false);
	
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

function goo_pools()
{
	repeat (5)
	{
		var pos = random_free_point_in_rect(x - 50, y - 50, x + 50, y + 50, oWall);
		instance_create_layer(pos.X, pos.Y, layer, oGooPool);
		attackCooldown = attackCooldownTime;
	}
}
