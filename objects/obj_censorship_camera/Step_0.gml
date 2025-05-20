if (!finished) {
	camera_set_view_pos(camera, camera_get_view_x(camera), camera_get_view_y(camera)+pan_rate);
	if (pan_rate == start_pan and camera_get_view_y(camera) >= (room_height - camera_get_view_height(camera)) * 0.55) pan_rate = slow_pan;
	
	if (camera_get_view_y(camera) >= room_height - camera_get_view_height(camera)) {
		finished = true;
		alarm[0] = wait_frames;
	}
}