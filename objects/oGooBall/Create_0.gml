/// @description Initialise values
speed = 5;
turnSpeed = 0;
alarm[0] = 2;
if (instance_exists(oPlayer)) direction = point_direction(x, y, oPlayer.x, oPlayer.y);

debrisRangeX = sprite_get_width(sprite_index) / 2;
debrisRangeY = sprite_get_height(sprite_index) / 2;
