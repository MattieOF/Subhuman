/// @description Update alpha and volume
if (alpha > 0)
	alpha -= 0.02;
if (alpha < 0)
	instance_destroy(id);

var num = audio_get_listener_count();
for( var i = 0; i < num; i++;)
{
    var info = audio_get_listener_info(i);
    audio_set_master_gain(info[? "index"], min(startAlpha - alpha, 1));
    ds_map_destroy(info);
}
