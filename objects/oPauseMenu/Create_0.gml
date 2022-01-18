/// @description Function defs, create ui

enabled = false;
pauseMenuCol = make_color_rgb(100, 100, 100);

start_stack("PauseMenu", 100, 200, 15, stackDir.vertical);
var lbl = create_label(0, 0, "Pause Menu");
lbl.drawInWorld = false;
add_to_stack(lbl);
end_stack();
instance_deactivate_layer("PauseMenu");

function deactivate_layers()
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++;)
	{
		var name = layer_get_name(a[i]);
		if (name == "Instances" || name == "Background") continue;
		instance_deactivate_layer(a[i]);
	}
}

function activate_layers()
{
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++;)
	{
		var name = layer_get_name(a[i]);
		instance_activate_layer(a[i]);
	}
}
