/// @description Close UI

if (surface_exists(global.pauseSurface)) surface_free(global.pauseSurface);
activate_game_layers();
instance_deactivate_layer("SelectionUI");
window_set_cursor(cr_none);
