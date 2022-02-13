/// @description Initialise the camera
/// Code from https://www.youtube.com/watch?v=LIjShsyOfEg

// Variables for camera lerp
lerpTime = 1.5 * room_speed; // 1.5 seconds
currentLerp = 0;

// Declare camera state
cameraX = 0;
cameraY = 0;
prevTargetX = 0;
prevTargetY = 0;
target = oPlayer;

// Viewport properties
cameraWidth = 683;
cameraHeight = 384;
zoom = 1; // Factor of viewport size

if (room == rmGame) zoom = 1.25;

// Setup camera in room
view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth * zoom, cameraHeight * zoom);
camera_set_view_pos(view_camera[0], cameraX, cameraY);

// Setup display
displayScale = 2; // Size of the window relative to the size of the viewport
global.displayWidth = cameraWidth * displayScale;
global.displayHeight = cameraHeight * displayScale;

// Set window properties
window_set_size(global.displayWidth, global.displayHeight);

// Set render surface to the size of the window, not the size of the camera
surface_resize(application_surface, global.displayWidth, global.displayHeight);
display_set_gui_size(global.displayWidth, global.displayHeight); // Same for GUI

// Center window after one frame
alarm[0] = 1;
