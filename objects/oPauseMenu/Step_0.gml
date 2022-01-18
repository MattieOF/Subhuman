/// @description Check for esc
if (control_check_pressed(controls.quit))
{
	if (enabled) event_user(1);
	else event_user(0);
}
