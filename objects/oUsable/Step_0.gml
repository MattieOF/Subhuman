/// @description Check for use

if (!interactable) return;
if (inRange && control_check_pressed(controls.save))
{
	if (requiresItem) oInventoryUI.open_inventory(id, consumeItem);
	else item_used();
}
