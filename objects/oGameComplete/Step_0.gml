/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0:
		if (titleAlpha < 1) titleAlpha += 0.02;
		else state = 1;
		break;
	case 1:
		if (titleTime > 0) titleTime--;
		else state = 2;
		break;
	case 2:
		if (titleAlpha > 0) titleAlpha -= 0.02;
		else state = 3;
		break;
	case 3:
		if (scoreAlpha < 1) scoreAlpha += 0.02;
		else state = 4;
		break;
	case 4:
		if (currentEnemyValue < data.enemyValue) 
			currentEnemyValue = min(data.enemyValue, currentEnemyValue + 20);
		else state = 5;
		break;
	case 5:
		if (currentSecondsValue < seconds) 
			currentSecondsValue = min(seconds, currentSecondsValue + 5);
		else state = 6;
		break;
	case 6:
		if (currentTimeScoreValue < timeScore) 
			currentTimeScoreValue = min(timeScore, currentTimeScoreValue + 40);
		else state = 7;
		break;
	case 7:
		if (pressEnterAlpha < 1) pressEnterAlpha += 0.02;
		if (keyboard_check_pressed(vk_enter))
			room_goto(rmMainMenu);
}

displayScore = currentEnemyValue + currentTimeScoreValue;
