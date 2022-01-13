var halfWidth = width / 2;
var halfHeight = height / 2;

if (point_in_rectangle(mouse_x, mouse_y, x - halfWidth, y - halfHeight, x + halfWidth, y + halfHeight))
{
	color = hoverColor;
	if (mouse_check_button(mb_left))
	{
		color = clickedColor;
		if (mouse_check_button_pressed(mb_left)) onPress();
	}
} else color = normalColor;
