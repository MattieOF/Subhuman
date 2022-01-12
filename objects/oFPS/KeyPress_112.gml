/// @description Toggle FPS display
if (!showFPS && !showRealFPS) showFPS = true;
else if (showFPS && !showRealFPS) showRealFPS = true;
else 
{
	showFPS = false;
	showRealFPS = false;
}
