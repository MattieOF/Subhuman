if (!interactable) return;

var halfWidth = width / 2;
var halfHeight = height / 2;

if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x - halfWidth, y - halfHeight, x + halfWidth, y + halfHeight))
{
	color = hoverColor;
	if (mouse_check_button(mb_left) || keyboard_check(vk_enter))
		color = clickedColor;
	else if (mouse_check_button_released(mb_left) || keyboard_check_released(vk_enter)) 
		if (onPress != undefined) onPress();
} else color = normalColor;
