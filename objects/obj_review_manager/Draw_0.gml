draw_set_font(fnt_menu);
draw_set_color(c_white);

//Day Text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_transformed(room_width*0.5, margin, day_text, day_scale, day_scale, 0);

//Other Text
draw_set_halign(fa_left);
for (var i = 0; i < stats_amount; i++) {
	var _stat = stats_text[i];
	var _y = margin + (line_height * (i+2));
	draw_set_color(c_white);
	draw_text_transformed(margin, _y, _stat.text, stats_scale, stats_scale, 0);
	draw_set_color(_stat.color);
	draw_text_transformed(margin + (string_width(_stat.text) * stats_scale), _y, _stat.value, stats_scale, stats_scale, 0);
	draw_text_transformed(margin + (string_width(_stat.text + _stat.value) * stats_scale), _y, _stat.units, stats_scale, stats_scale, 0);
}

//Continue Text
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
var _color = (hover == "continue") ? AMBER : c_white
draw_set_color(_color);
draw_text_transformed(room_width/3, room_height-margin, continue_text, action_scale, action_scale, 0);

//Exit Text
_color = (hover == "exit") ? AMBER : c_white
draw_set_color(_color);
draw_text_transformed(room_width*2/3, room_height-margin, exit_text, action_scale, action_scale, 0);