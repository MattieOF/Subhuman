/// @description Draw quitting ui

if (quitProgress > 0)
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_dkgray);
	draw_rectangle((room_width / 2) - 100, (room_height / 2) + 35, (room_width / 2) + 100, (room_height / 2) + 40, false);
	draw_set_color(c_white);
	draw_text(room_width / 2, room_height / 2, "Quitting...");
	draw_rectangle((room_width / 2) - 100, (room_height / 2) + 35, ((room_width / 2) - 100) + (200 * quitProgress), (room_height / 2) + 40, false);
}
