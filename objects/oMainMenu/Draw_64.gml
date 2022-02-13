/// @description Draw quitting ui

if (quitProgress > 0)
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_dkgray);
	draw_rectangle((global.displayWidth / 2) - 100, (global.displayHeight / 2) + 35, (global.displayWidth / 2) + 100, (global.displayHeight / 2) + 40, false);
	draw_set_color(c_white);
	draw_text(global.displayWidth / 2, global.displayHeight / 2, "Quitting...");
	draw_rectangle((global.displayWidth / 2) - 100, (global.displayHeight / 2) + 35, ((global.displayWidth / 2) - 100) + (200 * quitProgress), (global.displayHeight / 2) + 40, false);
}
