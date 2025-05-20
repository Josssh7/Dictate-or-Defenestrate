if (censored) exit;
hover = !obj_censorship_manager.finished and point_in_rectangle(mouse_x, mouse_y, x, top, x+width, bottom) and (device_mouse_y_to_gui(0) >= 30);
if (mouse_check_button_pressed(mb_left) and hover) {
	audio_play_sound(snd_censored, 10, false, 1, 0, random_range(0.8, 1.2));
	censored = true; 
}