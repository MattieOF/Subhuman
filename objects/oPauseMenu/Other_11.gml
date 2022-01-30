/// @description Close pause menu, free 
if (surface_exists(global.pauseSurface)) surface_free(global.pauseSurface);
activate_game_layers();
instance_deactivate_layer("PauseMenu");
// Hide cursor
window_set_cursor(cr_none);

state = 0;
