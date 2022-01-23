/// @description Close pause menu, free 
if (surface_exists(global.pauseSurface)) surface_free(global.pauseSurface);
activate_layers();
instance_deactivate_layer("PauseMenu");
// Hide cursor
window_set_cursor(cr_none);

enabled = false;
