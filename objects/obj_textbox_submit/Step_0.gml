if (get_hover(self)) sprite_index = spr_textbox_hover;
else sprite_index = spr_textbox_submit;

//Submit
if (get_clicked(self)) {
	//Check if empty
	for (var i=0; i<array_length(text_fields); i++) {
		if (text_fields[i].check_empty()) {
			show_message("All fields must be filled.");
			exit;
		}
	}
	
	for (var i=0; i<array_length(text_fields); i++) text_fields[i].submit_data();
	typing = false;
	save_game();
	room_goto(rm_meeting);
}