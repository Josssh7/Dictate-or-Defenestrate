draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_propaganda);

var _scale = 1;
var _max = room_width * 0.85;

var _lines = []
if (display_text != "") _lines = split_string_by_width([display_text], _max, _scale);
else if (prompt_text != "" and menu != noone) {
	var _desc = menu.description != "" and menu.hover != 0;
	_lines = split_string_by_width([prompt_text + menu.options[menu.hover-_desc].info.text], _max, _scale);
}

for (var i = 0; i < array_length(_lines); i++) {
	draw_text_transformed((room_width-string_width(_lines[i]))*0.5, 10+(line_height*i), _lines[i], _scale, _scale, 0);
}
	
if (fade_alpha == 0) exit;
//Background
draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

//Text
var _text_scale = 0.4;
var _yoffset = string_height(score_text.summary) * 0.5 * 1.25 * _text_scale;
draw_text_transformed(room_width*0.5, (room_height*0.35)-_yoffset, score_text.summary, _text_scale, _text_scale, 0);
if (score_text.improvement != 0) draw_text_transformed(room_width*0.5, (room_height*0.35)+_yoffset, string(score_text.improvement)+score_text.units, _text_scale, _text_scale, 0);

//Arrow
_scale = 6
if (score_text.improvement != 0) {	
	var _color = (score_text.improvement > 0) ? c_green : c_red;
	var _direction = (score_text.improvement > 0) ? 1 : -1;
	
	draw_sprite_ext(spr_improvement, 0, 
		((room_width+(string_width(string(score_text.improvement)+score_text.units+"  ")*_text_scale)) * 0.5) + 5, 
		(room_height*0.35)+_yoffset+30, _scale, _scale*_direction, 0, _color, 1);
}

//Press Enter
_scale = 0.4;
draw_text_transformed(room_width*0.5, room_height*0.75, "PRESS SPACE TO CONTINUE", _scale, _scale, 0);