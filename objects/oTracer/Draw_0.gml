/// @description Insert description here

var oldAlpha = draw_get_alpha();
draw_set_alpha((currentTime / maxTime) / 3);
draw_line_color(X, Y, endX, endY, colour, colour);
draw_set_alpha(oldAlpha);
