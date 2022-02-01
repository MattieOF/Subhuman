/// @description Insert description here
// You can write your code in this editor

tint = 0;

function load_checkpoint()
{
	room_goto(rmGame);
}

function load_menu()
{
	room_goto(rmMainMenu);
}

start_stack("GameOver", global.displayWidth / 2, 100, 5, stackDir.vertical, false);
add_to_stack(create_label(0, 0, "YOU DIED",,c_red,fntMainLarge,fa_center,fa_center));
add_stack_spacing(50);
add_to_stack(create_button(0, 0, 200, 40, "Load Checkpoint", load_checkpoint,,,,,,fa_center, fa_center));
add_to_stack(create_button(0, 0, 200, 40, "Exit to Menu", load_menu,,,,,,fa_center, fa_center));
add_to_stack(create_button(0, 0, 200, 40, "Exit to Desktop", quit_game,,,,,,fa_center, fa_center));
end_stack();

window_set_cursor(cr_default);
