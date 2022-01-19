/// @description Change frame, start game
if (state != 0) return;
if (global.debug && keyboard_check(vk_control)) room_goto(rmGame);
pressEnterFrame = 0;
state = 1;
