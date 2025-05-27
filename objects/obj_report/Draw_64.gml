if (!input_ok()) exit;
draw_set_color(c_white);

//Draw Report Background
draw_sprite_stretched(spr_textbox_report, 0, x-margin, y-margin, full_width, full_height);

//Draw Report Text
draw_set_font(fnt_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _lines = 0;
for (var i = 0; i < line_count; i++) {
	draw_set_color(c_white);
	if (i == 0) { //Top
		draw_set_color(CADET_GRAY);
		draw_text_transformed(x, y, name, scale, scale, 0);
	}
	else if (i == line_count - 1) { //Bottom
		if (mouse_over) draw_set_color(AMBER);
		draw_text_transformed(x, y + (_lines * line_height), END, scale, scale, 0);
	}
	else {
		var _str = text[i-1];
		draw_text_transformed(indent + x, y + (_lines * line_height), _str, scale, scale, 0);
	}
	_lines++;
}