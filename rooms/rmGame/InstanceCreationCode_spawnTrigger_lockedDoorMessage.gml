function on_trigger()
{
	if (!triggerable) return;
	var inst = instance_create_layer(0, 0, layer, oMessage);
	inst.init("This door is locked from the other side\nA bullet could probably knock that lock off",,4);
	triggerable = false;
	alarm[0] = 10 * room_speed;
}
