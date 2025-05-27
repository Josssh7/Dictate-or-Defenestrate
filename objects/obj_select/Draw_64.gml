//Draw Options Background
if (!input_ok()) exit;
draw_sprite_stretched(spr_textbox, 0, x-margin, y-margin, full_width+margin, full_height+margin);

draw_set_font(fnt_menu);
draw_set_valign(fa_top);
var _desc = (description != "");
for (var i = 0; i < options_count; i++) {
	if (i == 0 and _desc) {
		draw_set_color(CADET_GRAY);
		draw_set_halign(fa_center);
		draw_text_transformed(x+(full_width*0.5), y, description, scale, scale, 0);
	}
	else {
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		var _str = options[i-_desc].info.text;
		if (hover == i) {
			draw_set_color(AMBER);
			_str = HOVER_MARKER + _str;
		}
		draw_text_transformed(x, y + (i * line_height), _str, scale, scale, 0);
	}
}