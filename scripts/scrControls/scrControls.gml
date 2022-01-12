// Type definitions

/// @description Enum representing all controls that can be pressed
enum controls
{
	moveUp,
	moveDown,
	moveLeft,
	moveRight,
	attackPrimary,
	quit,
	screenshot,
	toggleDistort,
	toggleFPS
}

/// @description Enum representing the types of a control (key, mouse)
enum controlType
{
	key,
	mouse
}

/// @description Create a control struct, with a control type and a control value
/// @param {controlType} type - Type of the control, should be either key or mouse
/// @param value - Value of the control, should be a keyboard key code or a mousebutton id depending on the type
/// @returns {Control} A struct representing the control
function Control(_type, _value) constructor
{
	type = _type;
	value = _value;
}

control_defaults();

// Load controls from file, if it exists.
// If not, save defaults to file.
load_controls();

// Function defs.


function control_defaults()
{
	// Controls struct def
	global.controls = {};

	// Init default controls
	set_control(controls.moveUp,         new Control(controlType.key, ord("W")));
	set_control(controls.moveDown,       new Control(controlType.key, ord("S")));
	set_control(controls.moveLeft,       new Control(controlType.key, ord("A")));
	set_control(controls.moveRight,      new Control(controlType.key, ord("D")));
	set_control(controls.attackPrimary,  new Control(controlType.mouse, mb_left));
	set_control(controls.quit,           new Control(controlType.key, vk_escape));
	set_control(controls.toggleFPS,      new Control(controlType.key, vk_f1));
	set_control(controls.toggleDistort,  new Control(controlType.key, vk_f2));
	set_control(controls.screenshot,     new Control(controlType.key, vk_f5));
}

function reset_controls(backup = true, filename = "controls.json")
{
	if (backup == true && file_exists(filename))
		file_copy(filename, filename + ".old");
		
	control_defaults();
	save_controls(filename);
}

function set_control(controlId, controlValue)
{
	global.controls[$ controlId] = controlValue;
}

function get_control(controlId, controlValue)
{
	return global.controls[$ controlId];
}

function control_check(controlId)
{
	var control = global.controls[$ controlId];
	if (control == undefined) return false;
	
	switch (control.type)
	{
		case controlType.key:
			return keyboard_check(control.value);
		case controlType.mouse:
			return mouse_check_button(control.value);
		default:
			return false;
	}
}

function control_check_pressed(controlId)
{
	var control = global.controls[$ controlId];
	if (control == undefined) return false;
	
	switch (control.type)
	{
		case controlType.key:
			return keyboard_check_pressed(control.value);
		case controlType.mouse:
			return mouse_check_button_pressed(control.value);
		default:
			return false;
	}
}

function control_check_released(controlId)
{
	var control = global.controls[$ controlId];
	if (control == undefined) return false;
	
	switch (control.type)
	{
		case controlType.key:
			return keyboard_check_released(control.value);
		case controlType.mouse:
			return keyboard_check_released(control.value);
		default:
			return false;
	}
}

function load_controls(filename = "controls.json")
{
	if (!file_exists(filename)) 
	{
		save_controls(filename);
		return;
	}
	
	var file = file_text_open_read(filename);
	global.controls = json_parse(file_text_read_string(file));
	file_text_close(file);
}

function save_controls(filename = "controls.json")
{
	if (file_exists(filename)) file_delete(filename);
	
	var file = file_text_open_write(filename);
	file_text_write_string(file, json_stringify(global.controls));
	file_text_close(file);
}
