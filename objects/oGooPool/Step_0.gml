/// @description Insert description here
var point = random_point_in_rect(bbox_left, bbox_top, bbox_right, bbox_bottom);
create_debris(point.X, point.Y, sGooBallDebris, 1, 0.4, 0.2);
image_xscale -= 0.001;
image_yscale -= 0.001;

if (image_xscale <= 0) instance_destroy(id);

if (currentDmgTime > 0) currentDmgTime--;

