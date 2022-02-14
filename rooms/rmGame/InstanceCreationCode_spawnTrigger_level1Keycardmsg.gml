function on_trigger()
{
	if (!triggerable) return;
	var inst = instance_create_layer(0, 0, layer, oMessage);
	inst.init("This door requires a level 1 keycard",,2.5);
	triggerable = false;
	alarm[0] = 10 * room_speed;
}
