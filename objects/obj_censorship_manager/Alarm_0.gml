fade_alpha = min(fade_alpha + 0.05, 1);
if (fade_alpha < 1) alarm[0] = 1;
else {
	instance_deactivate_all(true);
	camera_set_view_pos(camera, 0, 0);
}