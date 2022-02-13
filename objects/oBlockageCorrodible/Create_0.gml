/// @description Init functions and vars
image_speed = 0;

function increase_stage()
{
	repeat (15)
	{
		var pos = random_point_in_rect(bbox_left, bbox_top, bbox_right, bbox_bottom);
		create_debris(pos.X, pos.Y, sBlockageCorrodibleDebris, 1, 1.5, 0.5);
	}
	
	set_stage(image_index + 1);
}

function set_stage(_stage)
{
	if (_stage >= sprite_get_number(sprite_index))
		done();
	else 
		image_index = _stage;
}

function done()
{
	var nearestDoor = instance_nearest(x, y, oDoor);
	nearestDoor.interactable = true;
	instance_destroy(id);
}
