/// @description Create temp pause surface
if (surface_exists(global.pauseSurface)) surface_free(global.pauseSurface);
global.pauseSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_copy(global.pauseSurface, 0, 0, application_surface);
// Deactivate gameplay layers
deactivate_layers();
// Activate pause menu layer
instance_activate_layer("PauseMenu");

enabled = true;
