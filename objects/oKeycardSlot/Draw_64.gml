/// @description Draw 
if (!interactable) return;
if (inRange)
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(global.displayWidth / 2, (global.displayHeight / 2) + 200, keycard != pointer_null ? format_string("Press E to take {0}", keycard.name) : "Press E to insert keycard");
}
