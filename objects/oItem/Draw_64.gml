/// @description Insert description here
// You can write your code in this editor

if (pickupable && inRange)
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fntMainLarge);
	var nameHeight = string_height(item.name);
	draw_text(global.displayWidth / 2, (global.displayHeight / 2) + 200, item.name);
	draw_set_font(fntMain);
	var descHeight = string_height(item.desc);
	draw_text(global.displayWidth / 2, (global.displayHeight / 2) + 205 + nameHeight, item.desc);
	draw_text(global.displayWidth / 2, (global.displayHeight / 2) + 210 + nameHeight + descHeight, "Press E to pick up");
}

var center = 200;
var extent = (currentBGAnim / bgAnimTime) * fullExtent;
switch (uiState)
{
	case 1:
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0, center - extent, global.displayWidth, center + extent, false);
		break;
	case 2:
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0, center - fullExtent, global.displayWidth, center + fullExtent, false);
		draw_set_color(invFull ? c_red : c_white);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_text(global.displayWidth / 2, center, invFull ? "Inventory Full" : "Picked up " + item.name);
		break;
	case 3:
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(0, center - extent, global.displayWidth, center + extent, false);
		break;
}
