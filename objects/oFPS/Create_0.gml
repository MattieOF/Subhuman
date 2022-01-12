/// @description Destroy if oFPS already exists, show FPS if in debug mode, init color
destroy_if_instance_exists();

if (global.debug == 1)
{
	showFPS = true;
	showRealFPS = true;
}

c = c_dkgray;
