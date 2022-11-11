/// @description AI

// This will pathfind to the player
image_angle = direction;

// return if player doesn't exist for some reason
if (!instance_exists(oPlayer)) return;

// For this enemy, we want it to look at where the player is, over which way it is facing
if (playerInView) image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
attackCooldown--;

if (moveSpeed > 1.2) moveSpeed -= 0.1;
if (moveSpeed < 1.2) moveSpeed = 1.2;

if (playerInView && attackCooldown <= 0)
{
	if (vulnerable)
		var attack = choose(throw_goo_ball, summon_tick, goo_pools);
	else
		var attack = choose(throw_goo_ball, throw_goo_ball, summon_tick); // Throw goo ball has 2/3 chance
		
	var playerDist = point_distance(x, y, oPlayer.x, oPlayer.y);
	if (playerDist < 120 && vulnerable) melee();
	else if (playerDist < 120) attack = melee;
	attack();
	attackCooldown = attackCooldownTime;
}

if (place_meeting(x, y, oVentSiphonorator))
{
	var prevX = image_xscale;
	var prevY = image_yscale;
	image_xscale = approach(image_xscale, 0.8, 0.05);
	image_yscale = approach(image_yscale, 0.8, 0.05);
	if (place_meeting(x, y, oWall)) 
	{
		image_xscale = prevX;
		image_yscale = prevY;
	}
}
else
{
	image_xscale = approach(image_xscale, 1.5, 0.05);
	image_yscale = approach(image_yscale, 1.5, 0.05);
}
