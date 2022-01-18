refresh_values();

function refresh_values()
{
	if (sprite == noone) return;
	if (sprite_exists(sprite)) 
	{
		log_format_string("Invalid sprite on oImage {0}", id);
		return;
	}
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
}

function draw()
{
	if (sprite == noone) return;
	draw_sprite_ext(sprite, frame, x, y, scale, scale, 0, color, alpha);
}
