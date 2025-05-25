///@desc See if mouse is hovering (mapped to different browser window sizes)
function get_hover(_obj) {
	var _x = mouse_x;
	var _y = mouse_y;
	
	if (os_browser != browser_not_a_browser) {	
		_x = device_mouse_x_to_gui(0);
		_y = device_mouse_y_to_gui(0);
	}
	
	return position_meeting(_x, _y, _obj) and input_ok();
}

///@desc See if left mb clicked on obj
function get_clicked(_obj) {
	return mouse_check_button_released(mb_left) and get_hover(_obj);
}