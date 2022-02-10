/// @description Destroy when animation over
if (sprite_index != -1 && image_index == sprite_get_number(sprite_index) - 1 && !done)
{
	done = true;
	alarm[0] = lastFrameTime;	
}
