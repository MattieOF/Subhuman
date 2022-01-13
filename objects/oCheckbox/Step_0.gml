if (!interactable) return;

if (point_in_rectangle(mouse_x, mouse_y, x + width / 2 - height, y - (height / 2), x + width / 2, y + (height / 2)))
{
	checkboxColor = hoveredCheckboxColor;
	if (mouse_check_button(mb_left) || keyboard_check(vk_enter))
		checkboxColor = clickedCheckboxColor;
	else if (mouse_check_button_released(mb_left) || keyboard_check_released(vk_enter)) 
	{
		checked = !checked;
		if (onToggle != undefined) onToggle(checked);
	}
} else checkboxColor = normalCheckboxColor;
