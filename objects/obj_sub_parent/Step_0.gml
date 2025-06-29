if (get_clicked(self) and !overlap()) {
	if (keyboard_check(vk_shift) and input_ok()) selected = !selected;
	else {
		menu_open = !menu_open;
		if (menu_open) {
			//Handle other items with menus
			close_other_menus(id);
			
			//Open menu
			obj_camera_zoom.new_target(self, relative_pos);
			display_details();
		}
		else close_menu(id);
		audio_play_sound(snd_click, 5, false);
	}
}

if (keyboard_check_released(vk_escape) and menu_open and input_ok()) close_menu(id);