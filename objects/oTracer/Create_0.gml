/// @description Function defs

function init(_x, _y, _endX, _endY, _color = c_white, _time = 0.5)
{
	X = _x;
	Y = _y;
	endX = _endX;
	endY = _endY;
	colour = _color;
	maxTime = _time * room_speed;
	currentTime = maxTime;
}
