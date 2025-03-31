if (get_clicked(self) and !overlap()) {
	show_debug_message(menu_open);
	menu_open = !menu_open;
	if (menu_open) {
		//Handle other subs
		var _ids = layer_get_all_elements("Subordinates");
		for (var i = 0; i < array_length(_ids); i++) {
			var _sub = layer_instance_get_instance(_ids[i]);
			if (_sub.menu != noone) { //Close their menu
				with (_sub) {	
					close_details(); //dont want to destroy any menu (other non-sub objects might have menus)
				}
			}
		}
		//Open menu
		obj_camera_zoom.new_target(self, relative_pos);
		display_details();
	}
	else close_details();
}

if (keyboard_check_released(vk_escape) and menu_open) close_details();