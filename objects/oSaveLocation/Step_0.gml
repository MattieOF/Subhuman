/// @description Insert description here
if (inRange && control_check_pressed(controls.save))
{
	set_save_location(id);
	oGameManager.save();
}
