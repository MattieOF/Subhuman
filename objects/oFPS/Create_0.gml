/// @description Destroy if oFPS already exists, show FPS if in debug mode, init color
if (instance_number(oFPS) != 1) instance_destroy(id);

if (global.debug == 1)
{
	showFPS = true;
	showRealFPS = true;
}

c = c_dkgray;
