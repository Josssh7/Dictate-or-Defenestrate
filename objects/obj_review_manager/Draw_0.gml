draw_set_font(fnt_menu);
draw_set_color(c_white);

//Day Text
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_transformed(room_width*0.5, margin, day_text, day_scale, day_scale, 0);

//Other Text
draw_set_halign(fa_left);

for (var i = 0; i < stats_amount; i++) {
	draw_text_transformed(margin, margin + (line_height * (i+2)), stats_text[i], stats_scale, stats_scale, 0);
}