if (!input_ok()) exit;
if (menu_open) {
	var _x = (margin + border)* 2.5;
	var _y = margin + border + offset;
	
	//Draw Background
	draw_set_color(CRIMSON);
	draw_rectangle(margin*2.5, margin+offset, room_width-(margin*2.5), offset+(room_height-margin), false);

	draw_set_color(#DBD4B3);
	draw_rectangle(_x, margin+border+offset, room_width-_x, offset+(room_height-(margin+border)), false);
	
	//Draw Text
	draw_set_font(fnt_menu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _line = 0;
	for (var i = 0; i < array_length(lines); i++) {
		draw_set_color(c_black);
		draw_text_transformed(_x+tab_x, _y+tab_y+(line_height*_line), lines[i].title, text_scale, text_scale, 0);
		_line++;
		draw_set_color(c_gray);
		for (var j = 0; j < array_length(lines[i].text); j++) {
			draw_text_transformed(_x+(tab_x*2), _y+tab_y+(line_height*_line), "+"+lines[i].text[j], text_scale, text_scale, 0);
			_line++;
		}
	}
}
