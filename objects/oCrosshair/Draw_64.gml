/// @description Draw

if (!player.reloading)
	draw_self();
else
	draw_circular_bar(x, y, player.loadout[$player.selectedLoadoutItem].weapon.reloadTime * room_speed - player.reloadTime, 
		player.loadout[$player.selectedLoadoutItem].weapon.reloadTime * room_speed, image_blend, 16, 1, 4);
