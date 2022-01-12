/// @description Take screenshot if button down
if (control_check_pressed(controls.screenshot))
{
	var path = "Screenshots/" + get_file_formatted_datetime();
	if (file_exists(path + ".png"))
	{
		var appendedNumber = 1;
		while (file_exists(path + "_" + string(appendedNumber) + ".png")) appendedNumber++;
		path = path + "_" + string(appendedNumber);
	}
	screen_save(path + ".png");
	state = 1;
	currentText = "Saved screenshot to " + path + ".png";
	currentDisplayTime = displayTime;
	currentFadeTime = fadeTime;
}

if (state == 1)
{
	currentDisplayTime--;
	if (currentDisplayTime <= 0) state = 2;
}
else if (state == 2)
{
	currentFadeTime--;
	if (currentFadeTime <= 0) state = 0;
}
