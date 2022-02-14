/// @description Check for controls

if (control_check_pressed(controls.openInventory) || control_check_pressed(controls.quit))
{
	switch (state)
	{
		case 0: open_inventory(); break;
		case 1:
		case 2: close_inventory(); break;
		case 3: close_note(); break;
	}
}

// if (state != 0 && control_check_pressed(controls.quit)) close_inventory();
