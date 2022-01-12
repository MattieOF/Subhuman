/// @description Draw UI

if (global.debug == 1)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(10, 10, "Main menu state: " + string(state));
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);

switch (state) {
    case 0:
		draw_sprite(sPressEnter, pressEnterFrame, room_width / 2, room_height / 2);
        break;
	case 1:
		draw_sprite_ext(sPressEnter, pressEnterFrame, room_width / 2, room_height / 2, 1, 1, 0, c_white, pressEnterAlpha);
		break;
	case 2:
		room_goto(rmMovementTest);
		break;
    default:
		show_debug_message("state switch broken!");
        break;
}
