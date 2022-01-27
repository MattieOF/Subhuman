/// @description Insert description here
if (showUI && inRange && control_check_pressed(controls.save))
{
	set_save_location(id);
	oGameManager.save();
	
	// Start animating
	currentBGAnim = 0;
	uiState = 1;
}

// Tick animation
switch (uiState)
{
	case 1:
		currentBGAnim++;
		if (currentBGAnim >= bgAnimTime)
		{
			// Start showing text
			currentTextTime = textTime;
			uiState = 2;
		}
		break;
	case 2:
		currentTextTime--;
		if (currentTextTime <= 0)
		{
			currentBGAnim = bgAnimTime;
			uiState = 3;
		}
		break;
	case 3:
		currentBGAnim--;
		if (currentBGAnim <= 0) uiState = 0;
		break;
}
