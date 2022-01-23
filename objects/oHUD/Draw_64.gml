/// @description Draw HUD
var selectedItemIndex = player.selectedLoadoutItem;
var selectedItem = player.loadout[$selectedItemIndex];
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, format_string("Selected index: {0}, name: {1}, loadout size: {2}, clip: {3}, reserve: {4}", selectedItemIndex, 
	selectedItem.weapon.name, player.loadoutSize, selectedItem.ammoClip, selectedItem.ammoReserve));

// Temp reload hud
draw_set_valign(fa_bottom);
if (player.reloading) 
	draw_text(10, global.displayHeight - 10, format_string("Reloading! Ticks left: {0}", player.reloadTime));
