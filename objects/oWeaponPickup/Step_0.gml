/// @description Insert description here
if (pickupable && inRange && control_check_pressed(controls.save))
{
	pickup();
	
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
		if (currentBGAnim <= 0) 
			instance_destroy(id);
		break;
}
