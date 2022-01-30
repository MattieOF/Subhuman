/// @description Draw inventory

if (state == 0) return;

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fntMainLarge);
draw_text(100, 50, "Inventory");
draw_set_font(fntMain);
