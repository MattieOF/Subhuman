/// @description Insert description here
switch (loadoutUiState)
{
	case 1:
		loadoutUiAlpha += 0.03;
		if (loadoutUiAlpha >= 1) 
		{
			loadoutUiState = 2;
			currentLoadoutUiTime = loadoutUiTime;
		}
		break;
	case 2:
		currentLoadoutUiTime--;
		if (currentLoadoutUiTime <= 0) loadoutUiState = 3;
		break;
	case 3:
		loadoutUiAlpha -= 0.03;
		if (loadoutUiAlpha <= 0) loadoutUiState = 0;
		break;
}
