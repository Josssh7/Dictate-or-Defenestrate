draw_set_font(fnt_menu);

var _x = room_width / 3;
var _y = room_height * 0.85;
var _w = string_width(restart_str) * action_scale;
var _h = string_height(restart_str) * action_scale;
if (point_in_rectangle(mouse_x, mouse_y, _x-(_w*0.5), _y-_h, _x+(_w*0.5), _y)) {
	hover = "restart";
	if (mouse_check_button_pressed(mb_left) and input_ok()) continue_game();
	exit;
}

_x *= 2;
_w = string_width(exit_str) * action_scale;
_h = string_height(exit_str) * action_scale;
if (point_in_rectangle(mouse_x, mouse_y, _x-(_w*0.5), _y-_h, _x+(_w*0.5), _y)) {
	hover = "exit";
	if (mouse_check_button_pressed(mb_left) and input_ok()) game_end();
	exit;
}

hover = "";