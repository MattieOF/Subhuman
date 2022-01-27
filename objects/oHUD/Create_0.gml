/// @description Function defs

/*
0 = off
1 = fade in
2 = showing
3 = fadeout
*/
loadoutUiState = 0;

loadoutUiAlpha = 0;
loadoutUiTime = 3 * room_speed;
currentLoadoutUiTime = 0;

function init(_playerId)
{
	player = _playerId;
}

function open_loadout_ui()
{
	if (loadoutUiState != 2) loadoutUiState = 1;
	else currentLoadoutUiTime = loadoutUiTime;
}
