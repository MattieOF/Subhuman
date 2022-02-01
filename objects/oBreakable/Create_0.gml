/// @description Insert description here

function breakItem()
{
	if (itemDrop != undefined) instance_create_layer(x, y, layer, oItem).init(itemDrop);
	create_debris(x, y, debrisSprite, 10, 2, 1);
	instance_destroy(id);
}
