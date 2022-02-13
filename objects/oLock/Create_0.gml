/// @description Function defs

function hit(_dmg = undefined) { unlock(); }

function unlock()
{
	create_debris(x, y, sLockDebris, 2, 0.75, 0.75);
	var nearestDoor = instance_nearest(x, y, oDoor);
	nearestDoor.interactable = true;
	if (destroyNearestTrigger) instance_destroy(instance_nearest(x, y, oSpawnTrigger));
	instance_destroy(id);
}
