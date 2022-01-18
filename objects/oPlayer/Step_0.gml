/// @description Movement and shooting

// Check input
// var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
// var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
// var up = keyboard_check(vk_up) || keyboard_check(ord("W"));
// var down = keyboard_check(vk_down) || keyboard_check(ord("S"));

var left = control_check(controls.moveLeft);
var right = control_check(controls.moveRight);
var up = control_check(controls.moveUp);
var down = control_check(controls.moveDown);

// Update sprite pos
playerSprite.x = x;
playerSprite.y = y;

// Look in direction of mouse
var targetAngle = point_direction(x, y, mouse_x, mouse_y);
playerSprite.image_angle = approach_angle(playerSprite.image_angle, targetAngle, 30);

// Movement
var hmove = right - left;
var vmove = down - up;

var dir = point_direction(0, 0, hmove, vmove);
var mag = (right - left != 0) || (down - up != 0);
hmove = lengthdir_x(movementSpeed * mag, dir);
vmove = lengthdir_y(movementSpeed * mag, dir);

// Based of code from https://www.youtube.com/watch?v=Tc4ijzjplZs
// Slightly edited to collide with solid objects and not specific objects.

if (!place_free(x + hmove, y))
{
	repeat (abs(hmove))
	{
		if (place_free(x + sign(hmove), y)) x += sign(hmove);
		else break;
	}
	hmove = 0;
}

if (!place_free(x, y + vmove))
{
	repeat (abs(vmove))
	{
		if (place_free(x, y + sign(vmove))) y += sign(vmove);
		else break;
	}
	vmove = 0;
}

x += hmove;
y += vmove;

// Shooting

if (control_check_pressed(controls.attackPrimary))
	show_debug_message("Shoot!");
