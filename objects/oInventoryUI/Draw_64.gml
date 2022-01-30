/// @description Draw inventory

if (state == 0) return;

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(fntMainLarge);
draw_text(100, 50, "Inventory");
draw_set_font(fntMain);

var itemWidth = 200;
var itemHeight = 150;
var itemIndex = 0;
var rows = 2, columns = 5;
var startX = 100;
var currentX = startX, currentY = 200;

for (var i = 0; i < rows; i++)
{
	for (var j = 0; j < columns; j++)
	{
		draw_set_color(c_black);
		draw_rectangle(currentX, currentY, currentX + itemWidth, currentY + itemHeight, true);
		
		if (selectedItem == itemIndex) draw_set_color(selectedColor);
		else if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), currentX, currentY, currentX + itemWidth, currentY + itemHeight)) 
			draw_set_color(hoveredColor);
		else draw_set_color(normalColor);
		
		draw_rectangle(currentX, currentY, currentX + itemWidth, currentY + itemHeight, false);
		
		currentX += itemWidth;
		itemIndex++;
	}
	currentX = startX;
	currentY += itemHeight;
}
