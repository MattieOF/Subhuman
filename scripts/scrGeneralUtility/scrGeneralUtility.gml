/// @desc Destroys the provided target if the number of the provided object is over the provided threshold
/// @param {object} objectIndex - Type of object to look for the number of. If undefined, it's set to object_index.
/// @param {int} threshold - If amount of instances of objectIndex is over this value, destroy the target. 1 by default.
/// @param {instance} target - Object to be destroyed if criteria is met. If undefined, it's set to id.
function destroy_if_instance_exists(objectIndex = undefined, threshold = 1, target = undefined)
{
	if (objectIndex == undefined) objectIndex = object_index;
	if (target == undefined) target = id;
	if (instance_number(id) > threshold) instance_destroy(target);
}

function approach(value, target, amount)
{
	return value + clamp(target - value, -amount, amount);
}

function approach_angle(value, target, amount, maximum = 360)
{
	var diff = target - value;
	if (abs(diff) >= 350) return target;
	return value + clamp(target - value, -amount, amount);
}

global.debrisLayer = undefined;
global.debrisObject = oDebris;
function create_debris(_x, _y, _sprite, _count, _lifetime, _speed, _dirMin = 0, _dirMax = 359)
{
	if (global.debrisLayer == undefined || !layer_exists(global.debrisLayer)) global.debrisLayer = layer_create(-500, "Debris");
	var debris = instance_create_layer(_x, _y, global.debrisLayer, global.debrisObject);
	debris.init(_sprite, _count, _speed, _lifetime, _dirMin, _dirMax);
	return debris;
}

global.tracersLayer = undefined;
global.tracersObject = oTracer;
function create_tracer(_x, _y, _endX, _endY, _time = 0.5, _col = c_white)
{
	if (global.tracersLayer == undefined || !layer_exists(global.tracersLayer)) global.tracersLayer = layer_create(-500, "Tracers");
	var tracer = instance_create_layer(_x, _y, global.tracersLayer, global.tracersObject);
	tracer.init(_x, _y, _endX, _endY, _col, _time);
	return tracer;
}

function angle_reverse(_angle)
{
	return (_angle + 180) % 360;
}

function Point(_x, _y) constructor
{
	X = _x;
	Y = _y;
}

function point_on_line(x1, y1, x2, y2, t)
{
	var dir = point_direction(x1, y1, x2, y2);
	var dist = point_distance(x1, y1, x2, y2);
	var outX = x1 + lengthdir_x(dist * t, dir);
	var outY = y1 + lengthdir_y(dist * t, dir);
	
	return new Point(outX, outY);
}

function deactivate_game_layers()
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++;)
	{
		var name = layer_get_name(a[i]);
		if (name == "Instances" || name == "Background") continue;
		instance_deactivate_layer(a[i]);
	}
}

function activate_game_layers()
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++;)
	{
		var name = layer_get_name(a[i]);
		if (name == "PauseMenu" || name == "LoadCheckpoint" || name == "Exit" || name == "SelectionUI")
			continue;
		instance_activate_layer(a[i]);
	}
}
