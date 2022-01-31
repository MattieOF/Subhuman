/// @description Draw inventory

if (state == 0) return;

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(fntMainLarge);
draw_text(100, 50, "Inventory");
draw_set_font(fntMain);
draw_set_color(c_ltgray);
if (selectionObj == undefined) var tipString = "Right click an item to drop it";
else var tipString = "Left click an item to select it, right click an item to drop it";
draw_text(102, 105, tipString);

var itemWidth = 200;
var itemHeight = 150;
var itemIndex = 0;
var rows = 2, columns = 5;
var startX = 100;
var currentX = startX, currentY = 200;
var hoveredIndex = -1;

for (var i = 0; i < rows; i++)
{
	for (var j = 0; j < columns; j++)
	{
		draw_set_color(c_black);
		draw_rectangle(currentX, currentY, currentX + itemWidth, currentY + itemHeight, true);
		
		if (selectedItem == itemIndex) draw_set_color(selectedColor);
		else if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), currentX, currentY, currentX + itemWidth, currentY + itemHeight)) 
		{
			draw_set_color(hoveredColor);
			hoveredIndex = itemIndex;
			
			if (player.inventory[itemIndex] != pointer_null)
			{
				if (mouse_check_button(mb_left))
					selectedItem = itemIndex;
				else if (mouse_check_button(mb_right))
					player.inventory_remove_index(itemIndex);
			}
		}
		else draw_set_color(normalColor);
		
		draw_rectangle(currentX, currentY, currentX + itemWidth, currentY + itemHeight, false);
		
		var textX = currentX + (itemWidth / 2);
		var textY = currentY + (itemHeight - 30);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		if (player.inventory[itemIndex] == pointer_null)
		{
			draw_set_color(textEmpty);
			draw_text(textX, textY, "Empty");
		}
		else
		{
			draw_set_color(textNormal);
			draw_text(textX, textY, player.inventory[itemIndex].name);
			draw_sprite(player.inventory[itemIndex].sprite, 0, textX, textY - (itemHeight / 2));
		}
		
		currentX += itemWidth;
		itemIndex++;
	}
	currentX = startX;
	currentY += itemHeight;
}

if (hoveredIndex != -1)
{
	// Draw tooltip
	
}
