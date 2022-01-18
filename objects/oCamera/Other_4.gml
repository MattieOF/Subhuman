/// @description Initialise the camera
/// Code from https://www.youtube.com/watch?v=LIjShsyOfEg

lerpTime = 1.5 * room_speed;
currentLerp = 0;

cameraX = 0;
cameraY = 0;
prevTargetX = 0;
prevTargetY = 0;
target = oPlayer;

cameraWidth = 683;
cameraHeight = 384;
zoom = 2;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth * zoom, cameraHeight * zoom);
camera_set_view_pos(view_camera[0], cameraX, cameraY);

displayScale = 2;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth, displayHeight);
surface_resize(application_surface, displayWidth, displayHeight);

alarm[0] = 1;
