function draw()
{
	var values = new DrawValues();

	var halfWidth = width / 2;
	var halfHeight = height / 2;

	draw_set_color(color);
	draw_set_alpha(alpha);
	draw_roundrect(x - halfWidth, y - halfHeight, x + halfWidth, y + halfHeight, false);
	if (selected) 
	{
		draw_set_color(outlineColor);
		draw_roundrect(x - halfWidth, y - halfHeight, x + halfWidth, y + halfHeight, true);
	}
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(x, y, text, 20, width, textScale, 
		textScale, 0, textColor, textColor, textColor, textColor, alpha);

	draw_set_values(values);
	delete values;
}

color = normalColor;
selected = true;
