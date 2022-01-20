/// @description Draw particles

for (var i = 0; i < array_length(objects); i++)
	draw_sprite_ext(sprite, 0, objects[i].X, objects[i].Y, 1, 1, 0, c_white, 1);
