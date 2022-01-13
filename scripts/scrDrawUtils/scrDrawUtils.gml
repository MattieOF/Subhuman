function DrawAligns() constructor
{
	halign = draw_get_halign();
	valign = draw_get_valign();
}

function draw_set_aligns(aligns)
{
	draw_set_halign(aligns.halign);
	draw_set_valign(aligns.valign);
}

function DrawValues() constructor
{
	aligns = new DrawAligns();
	alpha = draw_get_alpha();
	color = draw_get_color();
	font = draw_get_font();
}

function draw_set_values(values)
{
	draw_set_aligns(values.aligns);
	draw_set_alpha(values.alpha);
	draw_set_color(values.color);
	draw_set_font(values.font);
}
