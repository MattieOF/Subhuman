var oldFont = draw_get_font();
if (font == noone) font = -1;
draw_set_font(font);
width = string_width(text) + padding + height;
height = string_height(text);
draw_set_font(oldFont);
