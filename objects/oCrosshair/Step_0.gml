/// @description Update position and state

if (player == undefined) return;

x = device_mouse_x_to_gui(0);
y = device_mouse_y_to_gui(0);

// Check if we're over something that colours the crosshair
if (place_meeting(mouse_x, mouse_y, oPlayer)) image_blend = c_green;
else image_blend = c_white;
