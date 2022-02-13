function on_trigger()
{
	if (!triggerable) return;
	var inst = instance_create_layer(0, 0, layer, oMessage);
	inst.init("A highly corrosive substance could destroy this blockage",,4);
	triggerable = false;
	alarm[0] = 10 * room_speed;
}
