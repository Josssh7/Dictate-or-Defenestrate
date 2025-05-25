//Check for hover
var _x = room_width / 3; //Middle
var _y = room_height - margin; //Bottom
var _w = string_width(continue_text) * action_scale;
var _h = string_height(continue_text) * action_scale;
if (point_in_rectangle(mouse_x, mouse_y, _x-(_w*0.5), _y -_h, _x+(_w*0.5), _y)) {
	hover = "continue";
	if (mouse_check_button_pressed(mb_left) and input_ok()) { //Next Day
		next_day();
		room_goto(rm_meeting);
	}
	else exit;
}

_x *= 2;
_w = string_width(exit_text) * action_scale;
_h = string_height(exit_text) * action_scale;
if (point_in_rectangle(mouse_x, mouse_y, _x-(_w*0.5), _y -_h, _x+(_w*0.5), _y)) {
	hover = "exit";
	if (mouse_check_button_pressed(mb_left) and input_ok()) { //Close
		next_day();
		//Should save here
		game_end();
	}
	else exit;
}

hover = "";