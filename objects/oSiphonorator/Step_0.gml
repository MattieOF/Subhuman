/// @description AI

// Inherit the parent event
// This will pathfind to the player
event_inherited();

// return if player doesn't exist for some reason
if (!instance_exists(oPlayer)) return;

// For this enemy, we want it to look at where the player is, over which way it is facing
if (playerInView) image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);

attackCooldown--;

if (playerInView && attackCooldown <= 0)
{
	var attack = choose(throw_goo_ball, summon_tick);
	attack();
	attackCooldown = attackCooldownTime;
}
