if (!finished) camera_set_view_pos(camera, camera_get_view_x(camera), camera_get_view_y(camera)+pan_rate);
if (camera_get_view_y(camera) >= room_height - camera_get_view_height(camera)) {
	obj_censorship_manager.calculate_score();
	finished = true;
}