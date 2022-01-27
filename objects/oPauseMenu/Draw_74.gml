/// @description Insert description here
if (state == 0 || !surface_exists(global.pauseSurface)) return;
draw_surface_ext(global.pauseSurface, 0, 0, 1, 1, 0, pauseMenuCol, 1);
