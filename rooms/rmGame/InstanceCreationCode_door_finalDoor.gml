function item_used()
{
	// You won
	global.completionData = 
	{
		enemyValue : oGameManager.gameState.playerScore,
		ticksPlayed : oTimer.ticks
	};
	room_goto(rmGameComplete);
}
