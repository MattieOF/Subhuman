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
		break;
	case 3:
		break;
	case 4:
		break;
	case 5:
		room_goto(rmMovementTest);
		break;
	case 6:
		break;
	case 69:
		// Debug menu
		draw_text(room_width / 2, 250, "Delete Debug Menu");
		draw_text(room_width / 2, room_height / 2, "0 - Cancel");
		draw_text(room_width / 2, (room_height / 2) + 22, "1 - Reset controls");
		break;
    default:
		show_debug_message("state switch broken!");
        break;
}
