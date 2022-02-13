/// @description Initialise vars and functions

// -------------
// AI state vars
// -------------
playerLastX = pointer_null;
playerLastY = pointer_null;
playerInView = false;
timeSinceLastSawPlayer = 0;
latched = false;

// Start sight check alarm
alarm[0] = sightCheckTimer * room_speed;

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
}

function hit(_dmg = undefined)
{
	hurt(_dmg);
}

function retreat()
{
	instance_create_layer(x, y, layer, oAnimation).sprite_index = sTickRetreat;
	instance_destroy(id);
}

maxMoveSpeed = 10;
moveSpeed = 0;
moveDelay = 2;
alarm[1] = moveDelay * room_speed;
