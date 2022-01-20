/// @description Function defs

function Particle(_x, _y, _dir, _speed) constructor
{
	X = _x;
	Y = _y;
	dir = _dir;
	spd = _speed;
	
	function update()
	{
		X = X + (dcos(dir) * spd);
		Y = Y - (dsin(dir) * spd);
	}
}

function init(_sprite, _count, _speed, _lifetime, _dirMin = 0, _dirMax = 359)
{
	objects = array_create(_count);
	
	for (var i = 0; i < _count; i++)
		objects[i] = new Particle(x, y, random_range(_dirMin, _dirMax), _speed);
}
