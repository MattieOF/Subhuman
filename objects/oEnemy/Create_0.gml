/// @description Function defs

// Add to manager
oGameManager.gameState.enemies[$ id] = new EnemyInfo(x, y, enemyHealth);

function hurt(_dmg)
{
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
