/// @description Check for esc
if (control_check_pressed(controls.quit))
{
	switch (state)
	{
		case 0: event_user(0); break;
		case 1: event_user(1); break;
		case 2: close_load_checkpoint(); break;
	}
}
