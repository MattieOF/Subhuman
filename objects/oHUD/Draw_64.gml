/// @description Draw HUD
var selectedItemIndex = player.selectedLoadoutItem;
var selectedItem = player.loadout[$selectedItemIndex];
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(10, 10, format_string("Selected index: {0}, name: {1}, loadout size: {2}", selectedItemIndex, 
	selectedItem.weapon.name, player.loadoutSize));
