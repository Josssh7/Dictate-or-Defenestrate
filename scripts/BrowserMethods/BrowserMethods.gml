//Returns ratio for different window sizes in browser
function calibrate_window_x() {
	if(os_browser != browser_not_a_browser) {
	  return room_width / window_get_width();
	}
	else return 1;
}

function calibrate_window_y() {
	if (os_browser != browser_not_a_browser) {
		return room_height / window_get_height();
	}
	else return 1;
}

///@desc See if mouse is hovering (mapped to different browser window sizes)
function get_hover(_obj) {
	var _x = mouse_x * calibrate_window_x();
	var _y = mouse_y * calibrate_window_y();

	return position_meeting(_x, _y, _obj);
}

///@desc See if left mb clicked on obj
function get_clicked(_obj) {
	return mouse_check_button_released(mb_left) and get_hover(_obj);
}