/// @description Create temp pause surface
// Don't open if something else is already using the pause surface.
if (surface_exists(global.pauseSurface)) return;
global.pauseSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_copy(global.pauseSurface, 0, 0, application_surface);
// Deactivate gameplay layers
deactivate_game_layers();
// Activate pause menu layer
instance_activate_layer("PauseMenu");
// Show cursor
window_set_cursor(cr_default);

state = 1;
