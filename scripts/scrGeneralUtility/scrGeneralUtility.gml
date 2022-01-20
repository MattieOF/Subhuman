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
function create_debris(_x, _y, _sprite, _count, _lifetime, _speed)
{
	if (global.debrisLayer == undefined) global.debrisLayer = layer_create(-500, "Debris");
	var debris = instance_create_layer(_x, _y, global.debrisLayer, global.debrisObject);
	debris.init(_sprite, _count, _speed, _lifetime);
	return debris;
}
