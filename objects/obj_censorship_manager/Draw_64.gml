//Drawing the HUD
draw_set_font(fnt_timer)
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _seconds = max(0, round(timer * 30) div 1000);
var _mills = max(0, round(timer * 30) mod 1000);
var _timer_text = string(_seconds) + ":" + string(_mills);

draw_set_color(CRIMSON);
draw_rectangle(0, 0, display_get_gui_width()+timer_text_buffer, string_height(_timer_text) + (timer_text_buffer * 2), false);

draw_set_color(AMBER);

draw_text(10, timer_text_buffer, "CENSOR NOW!!!");
draw_text(display_get_gui_width()-string_width(_timer_text), timer_text_buffer, _timer_text);

if (fade_alpha == 0) exit;

//Background
draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

if (fade_alpha != 1) exit;

//Text
draw_set_font(fnt_menu);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _text_scale = 0.25;
var _line_height = 40;
var _margin = 10;
var _main_text = "Public Support: " + string(global.support) + "%";
var _score_text = "( " + string(censorship_score) + "%" + "   )";
draw_text_transformed(_margin, _margin, _main_text, _text_scale, _text_scale, 0);
if (censorship_score != 0) {
	//Text
	var _x = (_margin * 2) + (string_width(_main_text) * _text_scale);
	draw_text_transformed(_x, _margin, _score_text, _text_scale, _text_scale, 0);

	//Arrow
	var _scale = 4;
	var _color = (censorship_score > 0) ? c_green : c_red;
	var _direction = (censorship_score > 0) ? 1 : -1;
	
	draw_sprite_ext(spr_improvement, 0, _x+(string_width("("+string(censorship_score)+"% ")*_text_scale)+(sprite_get_width(spr_improvement)*_scale*0.5), 10+(sprite_get_height(spr_improvement)*_scale*0.5), _scale, _scale*_direction, 0, _color, 1);
}

//Mistakes
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _amount = array_length(mistakes);
var margin = 15;
var _line_gap = 30;
var _reason_scale = _text_scale * 0.5;
var _y = display_get_gui_height() * 0.45;

draw_text_transformed(display_get_gui_width()*0.5, display_get_gui_height()*0.3, "TODAY'S MISTAKES", 0.35, 0.35, 0);

if (_amount == 1) {
	draw_text_transformed(display_get_gui_width()*0.5, _y, mistakes[0].text, _text_scale, _text_scale, 0);
	
	var _color = (mistakes[0].reason == "MISSED") ? AMBER : CRIMSON;
	draw_text_transformed_color(display_get_gui_width()*0.5, _y+_line_gap, mistakes[0].reason, _reason_scale, _reason_scale, 0, _color, _color, _color, _color, 1);
}
else if (_amount == 2) {
	for (var i = 0; i < 2; i++) {
		draw_text_transformed(display_get_gui_width()*(i+1)/3, _y, mistakes[i].text, _text_scale, _text_scale, 0);
	
		var _color = (mistakes[i].reason == "MISSED") ? AMBER : CRIMSON;
		draw_text_transformed_color(display_get_gui_width()*(i+1)/3, _y+_line_gap, mistakes[i].reason, _reason_scale, _reason_scale, 0, _color, _color, _color, _color, 1);
	}
}
else if (_amount == 3) {
	for (var i = 0; i < 3; i++) {
		var _color = (mistakes[i].reason == "MISSED") ? AMBER : CRIMSON;
		draw_set_halign(fa_center);
		var _x = display_get_gui_width() * 0.5;
		if (i == 0) {
			draw_set_halign(fa_left);
			_x = _margin + (string_width(mistakes[i].text) * _text_scale);
		}
		else if (i == 2) {
			draw_set_halign(fa_right);
			_x = (display_get_gui_width() - _margin) - (string_width(mistakes[i].text) * _text_scale);
		}
	
		draw_set_halign(fa_center);
		draw_text_transformed(_x, _y, mistakes[i].text, _text_scale, _text_scale, 0);
		draw_text_transformed_color(_x, _y+_line_gap, mistakes[i].reason, _reason_scale, _reason_scale, 0, _color, _color, _color, _color, 1);
	}
}

//Press Enter
var _scale = 0.4;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(display_get_gui_width()*0.5, display_get_gui_height()*0.9, "PRESS SPACE TO CONTINUE", _scale, _scale, 0);