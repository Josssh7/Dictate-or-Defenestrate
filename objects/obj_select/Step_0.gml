if (!input_ok()) exit;
mouse_over = false;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (point_in_rectangle(_mx, _my, x, y, x+width, y+height)) {
	mouse_over = true;
	if (mx_prev != _mx or my_prev != _my) {
		var _mouse_hover_line = (_my - y) div line_height;
		if (_mouse_hover_line < 0) _mouse_hover_line = 0;
		if (_mouse_hover_line > options_count - 1) _mouse_hover_line = options_count - 1;
		hover = _mouse_hover_line;
	}
}

hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (hover > options_count - 1) hover = 0;
if (hover <  0) hover = options_count - 1;

if ((mouse_check_button_pressed(mb_left) and mouse_over) or keyboard_check_pressed(vk_enter)) {
	var _desc = (description != "");
	var _onclick = options[hover-_desc].onclick;
	if (_onclick != undefined) _onclick(options[hover-_desc].info);
}

mx_prev = _mx;
my_prev = _my;