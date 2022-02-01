/// @description Draw particles

for (var i = 0; i < array_length(objects); i++)
	draw_sprite_ext(sprite, objects[i].subimg, objects[i].X, objects[i].Y, 1, 1, 0, c_white, life / lifetime);
