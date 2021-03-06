/// @description Movement and shooting

// Check inputs
var left = control_check(controls.moveLeft);
var right = control_check(controls.moveRight);
var up = control_check(controls.moveUp);
var down = control_check(controls.moveDown);

// Update sprite pos
playerSprite.x = x;
playerSprite.y = y;

// Update hurt effect
tick_hurt_effect();

// Look in direction of mouse
var targetAngle = point_direction(x, y, mouse_x, mouse_y);
playerSprite.image_angle = approach_angle(playerSprite.image_angle, targetAngle, 30);

// Calculate movement
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

// ---------
// Shooting
// ---------

// Tick shooting variables
shootCooldown--;
reloadTime--;

if (reloading && reloadTime <= 0)
{
	reload();
	reloading = false;
}

if (control_check_pressed(controls.reload))
	reload_pressed();

if (control_check(controls.attackPrimary))
	shoot();
	
if (control_check_pressed(controls.weaponNext))
	next_weapon();
else if (control_check_pressed(controls.weaponPrevious))
	previous_weapon();

// Annoying range checks for objects with ranges, as there's no collision end event
var sl = instance_place(x, y, oSaveLocation);
if (sl != noone) sl.inRange = true;
else oSaveLocation.inRange = false;

if (instance_exists(oItem))
{
	var dItem = instance_place(x, y, oItem);
	if (dItem != noone) dItem.inRange = true;
	else oItem.inRange = false;
}

if (instance_exists(oWeaponPickup))
{
	var weaponPickup = instance_place(x, y, oWeaponPickup);
	if (weaponPickup != noone) weaponPickup.inRange = true;
	else oWeaponPickup.inRange = false;
}

if (instance_exists(oUsable))
{
	var usable = instance_place(x, y, oUsable);
	if (usable != noone) usable.inRange = true;
	else oUsable.inRange = false;
}

if (instance_exists(oFusebox))
{
	var fusebox = instance_place(x, y, oFusebox);
	if (fusebox != noone) fusebox.inRange = true;
	else oFusebox.inRange = false;
}

if (instance_exists(oKeycardSlot))
{
	var keycardSlot = instance_place(x, y, oKeycardSlot);
	if (keycardSlot != noone) keycardSlot.inRange = true;
	else oKeycardSlot.inRange = false;
}

if (instance_exists(oSpawnTrigger))
{
	var trigger = instance_place(x, y, oSpawnTrigger);
	if (trigger != noone) trigger.on_trigger();
}

if (currentOverhealTickTime > 0) currentOverhealTickTime--;
if (currentOverhealTickTime <= 0 && playerHealth > 100)
{
	playerHealth--;
	currentOverhealTickTime = overhealTickTime;
}
