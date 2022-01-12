/// @description Draw FPS
if (!showFPS) return;
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var fpsString = "FPS: " + string(fps);
var fpsRealString = "Real FPS: " + string(fps_real);

if (drawBG)
{
	
	var bgX = room_width - (string_width(showRealFPS ? fpsRealString : fpsString) + 8);
	draw_set_alpha(0.4);
	draw_rectangle_color(bgX, 3, room_width - 3, showRealFPS ? 48 : 28, c, c, c, c, false);
	draw_set_alpha(1);
}

draw_text(room_width - 5, 5, fpsString);
if (!showRealFPS) return;
draw_text(room_width - 5, 25, fpsRealString);
