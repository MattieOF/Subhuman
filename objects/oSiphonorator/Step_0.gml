/// @description AI

// Inherit the parent event
// This will pathfind to the player
event_inherited();

// return if player doesn't exist for some reason
if (!instance_exists(oPlayer)) return;

// For this enemy, we want it to look at where the player is, over which way it is facing
if (playerInView) image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);

attackCooldown--;

if (moveSpeed > 1.5) moveSpeed -= 0.1;
if (moveSpeed < 1.5) moveSpeed = 1.5;

if (playerInView && attackCooldown <= 0)
{
	var attack = choose(throw_goo_ball, summon_tick);
	var playerDist = point_distance(x, y, oPlayer.x, oPlayer.y);
	if (playerDist < 120) attack = melee;
	attack();
	attackCooldown = attackCooldownTime;
}