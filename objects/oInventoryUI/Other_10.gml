/// @description Open UI

global.pauseSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_copy(global.pauseSurface, 0, 0, application_surface);
deactivate_game_layers();
window_set_cursor(cr_default);
