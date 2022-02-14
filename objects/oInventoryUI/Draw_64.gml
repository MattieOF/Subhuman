/// @description Draw inventory

if (state == 0) return;

if (state == 3)
{
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	draw_set_font(fntMainLarge);
	draw_text(100, 50, currentNote.name);
	draw_set_font(fntMain);
	draw_text(100, 100, currentNote.text);
	return;
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(fntMainLarge);
draw_text(100, 50, "Inventory");
draw_set_font(fntMain);
draw_set_color(c_ltgray);
if (selectionObj == undefined) var tipString = "Right click an item to drop it, tab to close";
else var tipString = "Left click an item to select it, right click an item to drop it, tab to close";
draw_text(102, 105, tipString);

var mouseX = device_mouse_x_to_gui(0), mouseY = device_mouse_y_to_gui(0);
var itemWidth = 200;
var itemHeight = 150;
var itemIndex = 0;
var rows = player.inventorySlots / 5, columns = 5;
var startX = 100;
var currentX = startX, currentY = 200;
var hoveredIndex = -1;

for (var i = 0; i < rows; i++)
{
	for (var j = 0; j < columns; j++)
	{
		draw_set_color(c_black);
		draw_rectangle(currentX, currentY, currentX + itemWidth, currentY + itemHeight, true);
		
		if (point_in_rectangle(mouseX, mouseY, currentX + 1, currentY + 1, currentX + itemWidth, currentY + itemHeight)) 
		{
			draw_set_color(hoveredColor);
			if (selectedItem == itemIndex) draw_set_color(selectedColor);
			hoveredIndex = itemIndex;
			
			if (player.inventory[itemIndex] != pointer_null)
			{
				if (mouse_check_button(mb_left))
				{
					selectedItem = itemIndex;
					if (selectionObj == undefined && player.inventory[selectedItem].use != itemUse.none)
					{
						if (player.inventory[selectedItem].use == itemUse.note)
							useButton.text = "Read";
						else if (player.inventory[selectedItem].use == itemUse.healing)
							useButton.text = "Use";
						instance_activate_layer("UseUI");
					}
					else
						instance_deactivate_layer("UseUI");
				}
				else if (mouse_check_button(mb_right))
					drop(itemIndex);
			}
		}
		else if (selectedItem == itemIndex) draw_set_color(selectedColor);
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

if (hoveredIndex != -1 && player.inventory[hoveredIndex] != pointer_null)
{
	// Draw tooltip
	var border = 15;
	var name = player.inventory[hoveredIndex].name;
	var desc = player.inventory[hoveredIndex].desc;
	draw_set_font(fntMainLarge);
	var titleWidth = string_width(name);
	var titleHeight = string_height(name);
	draw_set_font(fntMain);
	var descWidth = string_width(desc);
	var descHeight = string_height(desc);
	var width = max(titleWidth, descWidth) + (border * 2);
	var height = titleHeight + descHeight + (border * 3);
	
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(mouseX + 10, mouseY + 10, mouseX + 10 + width, mouseY + 10 + height, false);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(mouseX + 10 + border, mouseY + 10 + (border * 2) + titleHeight, desc); // Draw desc first to skip a draw_set_font
	draw_set_font(fntMainLarge);
	draw_text(mouseX + 10 + border, mouseY + 10 + border, name);
}
