/// @description Set up values

destroy_if_instance_exists();

// 0 - Don't display
// 1 - Show text
// 2 - Fade out
state = 0;
displayTime = displayTime * room_speed;
fadeTime = fadeTime * room_speed;
currentDisplayTime = displayTime;
currentFadeTime = fadeTime;
currentText = "";
