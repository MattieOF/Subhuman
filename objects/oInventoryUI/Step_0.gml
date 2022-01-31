/// @description Check for controls

if (control_check_pressed(controls.openInventory))
{
	switch (state)
	{
		case 0: open_inventory(); break;
		case 1:
		case 2: close_inventory(); break;
	}
}

// if (state != 0 && control_check_pressed(controls.quit)) close_inventory();
