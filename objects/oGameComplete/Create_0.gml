/// @description Everything

/*
0 = fade in title
1 = hold on title
2 = fade out title
3 = score fade in
4 = tick enemy value
5 = tick seconds
6 = tick time score
7 = wait for enter
*/
state = 0;

titleAlpha = 0;
titleTime = 2 * room_speed;
pressEnterAlpha = 0;

scoreAlpha = 0;
displayScore = 0;

currentEnemyValue = 0;
currentSecondsValue = 0;
currentTimeScoreValue = 0;

data = global.completionData;
seconds = floor(data.ticksPlayed / room_speed);
timeScore = floor(min(lerp(20000, 0, seconds / 600), 15000));

function draw_title()
{
	draw_set_font(fntMainLargeBold);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(titleAlpha);
	
	draw_text(global.displayWidth / 2, global.displayHeight / 2, "SUBHUMAN");
	
	draw_set_alpha(1);
}

function draw_score()
{
	draw_set_font(fntMainBold);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_alpha(scoreAlpha);
	
	draw_text(40, 140, "Total Score");
	
	draw_set_color(c_dkgray);
	draw_rectangle(40, 160, global.displayWidth - 40, 180, false);
	draw_set_color(displayScore >= 0 ? c_white : c_dkgray);
	draw_text(40, 185, "0");
	draw_set_halign(fa_center);
	draw_set_color(displayScore >= 2500 ? c_white : c_dkgray);
	draw_text(lerp(40, global.displayWidth - 40, 0.25), 185, "2500");
	draw_set_color(displayScore >= 5000 ? c_white : c_dkgray);
	draw_text(lerp(40, global.displayWidth - 40, 0.5), 185, "5000");
	draw_set_color(displayScore >= 7500 ? c_white : c_dkgray);
	draw_text(lerp(40, global.displayWidth - 40, 0.75), 185, "7500");
	draw_set_color(displayScore >= 10000 ? c_white : c_dkgray);
	draw_set_halign(fa_right);
	draw_text(global.displayWidth - 40, 185, "10000");
	if (displayScore >= 10000) draw_text(global.displayWidth - 40, 200, "Secret level unlocked");
	draw_set_color(c_white);
	draw_rectangle(40, 160, min(lerp(40, global.displayWidth - 40, displayScore / 10000), global.displayWidth - 40), 180, false);
	
	draw_set_font(fntMainLargeBold);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(global.displayWidth / 2, global.displayHeight / 2, string(displayScore));
	
	draw_set_alpha(1);
}

function draw_enemy_score()
{
	draw_set_alpha(1);
	draw_set_color(state == 4 ? c_white : c_dkgray);
	draw_set_font(fntMainBold);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	var width1 = string_width("Seconds played:");
	var width2 = string_width("Enemy kills value:");
	draw_text(global.displayWidth / 2 - width1 - (width2) - 30, global.displayHeight / 2 + 100, "Enemy kills value:");
	draw_set_font(fntMain);
	draw_text(global.displayWidth / 2 - width1 - (width2) - 30, global.displayHeight / 2 + 118, string(currentEnemyValue));
}

function draw_seconds()
{
	draw_set_alpha(1);
	draw_set_color(state == 5 ? c_white : c_dkgray);
	draw_set_font(fntMainBold);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	var width = string_width("Seconds played:");
	draw_text(global.displayWidth / 2 - (width / 2), global.displayHeight / 2 + 100, "Seconds played:");
	draw_set_font(fntMain);
	draw_text(global.displayWidth / 2 - (width / 2), global.displayHeight / 2 + 118, string(currentSecondsValue));
}

function draw_time_score()
{
	draw_set_alpha(1);
	draw_set_color(state == 6 ? c_white : c_dkgray);
	draw_set_font(fntMainBold);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	var width = string_width("Seconds played:");
	draw_text(global.displayWidth / 2 + width + 30, global.displayHeight / 2 + 100, "Time bonus:");
	draw_set_font(fntMain);
	draw_text(global.displayWidth / 2 + width + 30, global.displayHeight / 2 + 118, string(currentTimeScoreValue));
}

function draw_press_enter()
{
	draw_set_alpha(pressEnterAlpha);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_font(fntMainBold);
	draw_text(global.displayWidth / 2, global.displayHeight - 150, "Press enter to return to the menu");
}
