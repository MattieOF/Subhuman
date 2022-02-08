// Temp ai - charge at player
log_format_string("{0}: Moving!", id);
mp_linear_step_object(oPlayer.x, oPlayer.y, 1.5, oSolid);
image_angle = direction;
