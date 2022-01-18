/// @description Initialise the camera

cameraX = 0;
cameraY = 0;
target = oPlayer;

cameraWidth = 683;
cameraHeight = 384;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);

displayScale = 2;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(cameraWidth, cameraHeight);
surface_resize(application_surface, displayWidth, displayHeight);
window_center();
