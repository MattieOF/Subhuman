/// @description Add to manager
oGameManager.saveLocations[$name] = id;
if (spawnPoint) set_save_location(id);
inRange = false;

bgAnimTime = 0.25 * room_speed;
textTime = 1 * room_speed;
fullExtent = 30;
currentBGAnim = 0;
currentTextTime = 0;

/*
0 = none
1 = animate background
2 = show text
3 = animate background reverse
*/
uiState = 0;
