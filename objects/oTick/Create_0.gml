/// @description Initialise vars and functions

// -------------
// AI state vars
// -------------
playerLastX = pointer_null;
playerLastY = pointer_null;
playerInView = false;
timeSinceLastSawPlayer = 0;
latched = false;
suckSound = undefined;

// Start sight check alarm
alarm[0] = sightCheckTimer * room_speed;

// --------------------
// Function definitions
// --------------------
function hurt(_dmg)
{
	if (_dmg == undefined) return;
	audio_play_sound(sndTickHurt, 0, false);
	create_debris(x, y, sBloodParticle, 8, 2, 0.4);
	enemyHealth -= _dmg;
	if (enemyHealth <= 0)
		die();
}

function die()
{
	if (suckSound != undefined) audio_stop_sound(suckSound);
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
