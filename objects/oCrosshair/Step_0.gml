/// @description Update position and state

if (player == undefined) return;

x = mouse_x;
y = mouse_y;

// Check if we're over something that colours the crosshair
if (place_meeting(x, y, oPlayer)) image_blend = c_green;
else image_blend = c_white;
