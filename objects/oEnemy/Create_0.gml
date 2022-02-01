/// @description Function defs

// Add to manager
oGameManager.gameState.enemies[$ id] = new EnemyInfo(x, y, enemyHealth);

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
