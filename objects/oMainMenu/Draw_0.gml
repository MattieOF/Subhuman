/// @description Draw UI

if (global.debug == 1)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(10, 10, "Main menu state: " + string(state));
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_sprite_ext(titleGraphic, 0, global.displayWidth / 4 - halfTitleGraphicWidth, 50, 1, 1, 0, c_white, titleGraphicAlpha);

switch (state) {
    case 0:
		draw_sprite(sPressEnter, pressEnterFrame, global.displayWidth / 4, global.displayHeight / 4);
        break;
	case 1:
		draw_sprite_ext(sPressEnter, pressEnterFrame, global.displayWidth / 4, global.displayHeight / 4, 1, 1, 0, c_white, pressEnterAlpha);
		break;
	case 2:
		break;
	case 3:
		break;
	case 4:
		break;
	case 5:
		break;
	case 6:
		break;
	case 7:
		break;
	case 8:
		break;
	case 69:
		// Debug menu
		draw_text(global.displayWidth / 4, 150, "Delete Debug Menu");
		draw_text(global.displayWidth / 4, global.displayHeight / 4, "0 - Cancel");
		draw_text(global.displayWidth / 4, (global.displayHeight / 4) + 22, "1 - Reset controls");
		draw_text(global.displayWidth / 4, (global.displayHeight / 4) + 44, "2 - Go to movement test");
		draw_text(global.displayWidth / 4, (global.displayHeight / 4) + 66, "3 - Delete save");
		draw_text(global.displayWidth / 4, (global.displayHeight / 4) + 88, "4 - Test end game");
		break;
    default:
		show_debug_message("state switch broken!");
        break;
}
