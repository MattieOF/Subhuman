/// @description Toggle FPS display

if (control_check_pressed(controls.toggleFPS))
{
	if (!showFPS && !showRealFPS) showFPS = true;
	else if (showFPS && !showRealFPS) showRealFPS = true;
	else 
	{
		showFPS = false;
		showRealFPS = false;
	}
}
