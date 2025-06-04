if (get_hover(self)) sprite_index = spr_textbox_hover;
else sprite_index = spr_textbox_submit;

//Submit
if (get_clicked(self)) {
	for (var i=0; i<array_length(text_fields); i++) text_fields[i].submit_data();
	save_game();
	room_goto(rm_meeting);
}