/// @description Function defs

// Add to manager
oGameManager.gameState.enemies[$ id] = new EnemyInfo(x, y, enemyHealth);

// -------------
// AI state vars
// -------------
playerLastX = undefined;
playerLastY = undefined;
playerInView = false;

// Start sight check alarm
alarm[0] = sightCheckTimer * room_speed;

function hurt(_dmg)
{
	create_debris(x, y, sBloodParticle, 8, 2, 0.4);
	enemyHealth -= _dmg;
	if (enemyHealth <= 0)
		die();
}

function die()
{
	instance_destroy(id);
	oGameManager.gameState.playerScore += value;
	oGameManager.gameState.enemies[$ id] = undefined;
}

function hit(_dmg = undefined)
{
	hurt(_dmg);
}
