if (get_hover(self)) sprite_index = spr_textbox_hover;
else sprite_index = spr_textbox;

if (get_clicked(self)) {
	if (other_id.typing) {
		with (other_id) { //Turn off other button
			typing = false;
			turn_off();
		}
	} //Updating this button
	typing = !typing;
	if (typing) {
		blinking = true;
		alarm[0] = blink_time;
	}
	else turn_off();
	keyboard_string = text; //So any keys pressed while !typing are removed
}
//Full caps, trim spaces during data sanitisation
if (typing) text = string_upper(keyboard_string);