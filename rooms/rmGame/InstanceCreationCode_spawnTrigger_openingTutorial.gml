function on_trigger()
{
	if (!triggerable) return;
	var inst = instance_create_layer(0, 0, layer, oMessage);
	inst.init("WASD to move\nLMB to attack\nScroll wheel to switch weapon\nE to use/pickup\nTab to view inventory",, 8, 60);
	triggerable = false;
	alarm[0] = 20 * room_speed;
}
