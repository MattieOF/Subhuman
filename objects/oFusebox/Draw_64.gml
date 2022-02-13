/// @description Draw 
if (!interactable) return;
if (inRange)
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(global.displayWidth / 2, (global.displayHeight / 2) + 200, hasFuse ? "Press E to take fuse" : "Press E to insert fuse");
}
