mouse_over = false;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

draw_set_font(fnt_menu); //for string measurements

if (point_in_rectangle(_mx, _my, x, y + ((line_count-1) * line_height), x+(string_width(END) * scale), y+full_height-(margin*2))) mouse_over = true;

if ((mouse_check_button_pressed(mb_left) and mouse_over) or keyboard_check_pressed(vk_enter)) {
	if (previous_menu != noone) instance_activate_object(previous_menu);
	instance_destroy();
}
	
mx_prev = _mx;
my_prev = _my;