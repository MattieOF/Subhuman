/// @description Setup enemy

// Add to manager
oGameManager.gameState.enemies[$ id] = new EnemyInfo(x, y, enemyHealth);

moveSpeed = 1.5;

// -------------
// AI state vars
// -------------
playerLastX = pointer_null;
playerLastY = pointer_null;
playerInView = false;

// Start sight check alarm
alarm[0] = 1;

// --------------------
// Function definitions
// --------------------
function hurt(_dmg)
{
	if (_dmg == undefined) return;
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
