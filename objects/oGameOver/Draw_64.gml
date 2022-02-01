/// @description Insert description here
if (!surface_exists(global.gameOverSurface)) return;
draw_surface_ext(global.gameOverSurface, 0, 0, 1, 1, 0, color_lerp(c_white, c_red, tint), 1);
