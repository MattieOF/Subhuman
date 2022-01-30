/// @description Draw BG

if (state == 0 || !surface_exists(global.pauseSurface)) return;
draw_surface_ext(global.pauseSurface, 0, 0, 1, 1, 0, bgTint, 1);
