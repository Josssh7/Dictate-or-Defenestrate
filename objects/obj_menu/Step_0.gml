mouse_over = false;

var _y = y + height + options_buffer;

if (point_in_rectangle(get_mouse_x(), get_mouse_y(), x, _y, x+width, _y+options_height)) {
	mouse_over = true;
	if (mx_prev != get_mouse_x() or my_prev != get_mouse_y()) {
		var _mouse_hover_line = (get_mouse_y() - y) div line_height;
		if (description != -1) _mouse_hover_line -= 1;
		if (_mouse_hover_line < 0) _mouse_hover_line = 0;
		if (_mouse_hover_line > options_count - 1) _mouse_hover_line = options_count - 1;
		hover = _mouse_hover_line
	}
}

hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (hover > options_count - 1) hover = 0;
if (hover <  0) hover = options_count - 1;

if ((mouse_check_button_pressed(mb_left) and mouse_over) or keyboard_check_pressed(vk_enter)) {
	var _meth = options[hover].method;
	if (_meth != undefined) _meth();
	instance_destroy();
}

mx_prev = get_mouse_x();
my_prev = get_mouse_y();