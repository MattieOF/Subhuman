/// @description Movement

// Check input
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var down = keyboard_check(vk_down) || keyboard_check(ord("S"));

x += movementSpeed * (right - left);
y += movementSpeed * (down - up);

if (!place_free(x, yprevious)) x = xprevious;
if (!place_free(xprevious, y)) y = yprevious;
