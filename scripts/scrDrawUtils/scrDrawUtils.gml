/// @desc Creating this struct populates the halign and valign variables with the current draw_halign and draw_valign
function DrawAligns() constructor
{
	halign = draw_get_halign();
	valign = draw_get_valign();
}

/// @desc Set draw halign and valign to values in provided DrawAligns struct
/// @param {DrawAligns} aligns - DrawAligns struct with desired halign and valign
function draw_set_aligns(aligns)
{
	draw_set_halign(aligns.halign);
	draw_set_valign(aligns.valign);
}

/// @desc Struct containing some common draw values (DrawAligns, alpha, color, font)
function DrawValues() constructor
{
	aligns = new DrawAligns();
	alpha = draw_get_alpha();
	color = draw_get_color();
	font = draw_get_font();
}

/// @desc Sets some draw values to those given with the provided DrawValues struct
/// @param {DrawValues} values - DrawValues struct containing values to be used
function draw_set_values(values)
{
	draw_set_aligns(values.aligns);
	draw_set_alpha(values.alpha);
	draw_set_color(values.color);
	draw_set_font(values.font);
}
