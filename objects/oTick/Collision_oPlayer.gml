/// @description Latch onto player
if (latched) return;
playerOffset = angle_reverse(point_direction(x, y, other.x, other.y));
playerOffsetLength = 20;
alarm[2] = 1;
sprite_index = sTickLatched;
latched = true;
suckSound = audio_play_sound(sndTickSuck, 0, true);
