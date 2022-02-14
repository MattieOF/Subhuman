/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0:
	case 1:
	case 2:
		draw_title();
		break;
	case 7:
		draw_press_enter();
	case 6:
		draw_time_score();
	case 5:
		draw_seconds();
	case 4:
		draw_enemy_score();
	case 3:
		draw_score();
		break;
}
