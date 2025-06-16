event_inherited();

if (input_ok() and keyboard_check_pressed(vk_escape)) {
	menu_open = false; //Important for pressing escape key
	obj_camera_zoom.reset_target();
}