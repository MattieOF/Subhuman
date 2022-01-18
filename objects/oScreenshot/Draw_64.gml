/// @description Draw text

if (state != 0)
{
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	draw_text_color(10, global.displayHeight - 10, currentText, c_white, c_white, c_white, c_white, currentFadeTime / fadeTime);
}
