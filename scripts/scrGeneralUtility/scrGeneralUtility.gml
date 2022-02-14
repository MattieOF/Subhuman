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
function create_debris(_x, _y, _sprite, _count, _lifetime, _speed, _dirMin = 0, _dirMax = 359, speedRange = 0)
{
	if (global.debrisLayer == undefined || !layer_exists(global.debrisLayer)) global.debrisLayer = layer_create(-500, "Debris");
	var debris = instance_create_layer(_x, _y, global.debrisLayer, global.debrisObject);
	debris.init(_sprite, _count, _speed, _lifetime, _dirMin, _dirMax, speedRange);
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
		if (name == "PauseMenu" || name == "LoadCheckpoint" || name == "Exit" || name == "SelectionUI" || name == "UseUI" || name == "CloseUI")
			continue;
		instance_activate_layer(a[i]);
	}
}

function play_sound_if_exists(_sound, _priority = 0, _loops = false)
{
	if (_sound == undefined || _sound == noone || _sound == pointer_null)
		return;
	audio_play_sound(_sound, _priority, _loops);
}

function color_lerp(a, b, amount)
{
	var _ar = color_get_red(a);
	var _ag = color_get_green(a);
	var _ab = color_get_blue(a);
	
	var _br = color_get_red(b);
	var _bg = color_get_green(b);
	var _bb = color_get_blue(b);
	
	return make_color_rgb(lerp(_ar, _br, amount), lerp(_ag, _bg, amount), lerp(_ab, _bb, amount));
}

function color_lerp_rgb(ar, ag, ab, br, bg, bb, amount)
{
	return make_color_rgb(lerp(ar, br, amount), lerp(ag, bg, amount), lerp(ab, bb, amount));
}

function color_invert(colour)
{
	var _r = color_get_red(colour);
	var _g = color_get_green(colour);
	var _b = color_get_blue(colour);
	
	return make_color_rgb(255 - _r, 255 - _g, 255 - _b);
}

function color_invert_rgb(r, g, b)
{
	return make_color_rgb(255 - r, 255 - g, 255 - b);
}

function goo_ball_explode()
{
	create_debris(x, y, sGooBallDebris, 20, 1.5, 0.4,,, 0.1);
	audio_play_sound(sndGooBallExplode, 0, false);
	instance_destroy(id);
}

function random_point_in_rect(x1, y1, x2, y2)
{
	var _x = random_range(x1, x2);
	var _y = random_range(y1, y2);
	
	return 
	{
		X : _x,
		Y : _y
	};
}

function random_free_point_in_rect(x1, y1, x2, y2, obj = undefined, tries = 100)
{
	do
	{
		var _x = random_range(x1, x2);
		var _y = random_range(y1, y2);
		tries--;
	} until ((obj != undefined ? !place_meeting(_x, _y, obj) : place_free(_x, _y)) || tries <= 0);
	
	return 
	{
		X : _x,
		Y : _y
	};
}

function show_ui_message(_text, _textTime = 1, _bgTime = 0.25)
{
	var inst = instance_create_layer(0, 0, layer, oMessage);
	inst.init(_text, _bgTime, _textTime);
	return inst;
}
