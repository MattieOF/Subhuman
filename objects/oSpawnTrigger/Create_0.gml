/// @description Insert description here

triggerable = true;

function on_trigger()
{
	if (!triggerable) return;
	if (global.positions[$ positionId] == undefined) return;
	if (!object_exists(objectToSpawn)) return;
	if (layerToSpawnOn == undefined) layerToSpawnOn = layer;
	
	var pos = global.positions[$ positionId];
	var inst = instance_create_layer(pos.X, pos.Y, layerToSpawnOn, objectToSpawn);
	instance_destroy(id);
	return inst;
}
