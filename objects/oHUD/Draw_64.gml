/// @description Draw HUD
var selectedItemIndex = player.selectedLoadoutItem;
var selectedItem = player.loadout[$selectedItemIndex];
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);
if (variable_struct_exists(selectedItem, "ammoClip"))
	draw_text(10, 10, format_string("Selected index: {0}, name: {1}, loadout size: {2}, clip: {3}, reserve: {4}", selectedItemIndex, 
		selectedItem.weapon.name, player.loadoutSize, selectedItem.ammoClip, selectedItem.ammoReserve));
else
	draw_text(10, 10, format_string("Selected index: {0}, name: {1}, loadout size: {2}", selectedItemIndex, 
		selectedItem.weapon.name, player.loadoutSize));

// Temp reload hud
draw_set_valign(fa_bottom);
if (player.reloading) 
	draw_text(10, global.displayHeight - 10, format_string("Reloading! Ticks left: {0}", player.reloadTime));

if (loadoutUiState == 0) return;
var loadoutUiHeight = 100;
var loadoutUiWidth = 150;

var halfTotalWidth = (player.loadoutSize * loadoutUiWidth) / 2;
var currentX = (global.displayWidth / 2) - halfTotalWidth;
var startY = global.displayHeight;
var endY = global.displayHeight - loadoutUiHeight;
var textY = global.displayHeight - 30;
var ammoTextY = global.displayHeight - 10;
for (var i = 0; i < player.loadoutSize; i++)
{
	draw_set_alpha(loadoutUiAlpha * 0.6);
	var colour = (i == player.selectedLoadoutItem ? c_ltgray : c_dkgray);
	draw_set_color(colour);
	draw_rectangle(currentX, startY, currentX + loadoutUiWidth, endY, false);
	draw_set_alpha(loadoutUiAlpha);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(currentX + (loadoutUiWidth / 2), textY, player.loadout[$i].weapon.name);
	if (variable_struct_exists(player.loadout[$i], "ammoClip"))
		var ammoString = format_string("{0}/{1}", player.loadout[$i].ammoClip, player.loadout[$i].ammoReserve);
	else
		var ammoString = "∞";
	draw_text(currentX + (loadoutUiWidth / 2), ammoTextY, ammoString);
	draw_sprite_stretched(player.loadout[$i].weapon.sprite, 0, currentX + 20, endY + 15, loadoutUiWidth - 40, loadoutUiHeight - 60);
	currentX += loadoutUiWidth;
}
draw_set_alpha(1);

