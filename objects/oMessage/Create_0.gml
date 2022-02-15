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

function init(_text, _bgAnimTime = 0.25, _textTime = 1, _extent = 30)
{
	text = _text;
	bgAnimTime = _bgAnimTime * room_speed;
	textTime = _textTime * room_speed;
	uiState = 1;
	fullExtent = _extent;
	audio_play_sound(sndNotif, 0, false);
}
