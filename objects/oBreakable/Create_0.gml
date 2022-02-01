/// @description Function defs

function breakItem()
{
	if (itemDrop != undefined) instance_create_layer(x, y, layer, oItem).init(itemDrop);
	if (debrisSprite != noone) create_debris(x, y, debrisSprite, 10, 0.5, 0.25);
	instance_destroy(id);
}

function hit(_dmg = undefined)
{
	breakItem();
}
