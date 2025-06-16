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
	audio_play_sound(snd_click, 5, false);
}
//Full caps, trim spaces during data sanitisation
draw_set_font(fnt_dialogue);
if (typing) {
	draw_set_font(fnt_dialogue); //Keeping it inside width of textbox
	if (string_width(text) * scale > sprite_width * 0.92) {
		blinking = false;
		alarm[0] = -1;
		maxed = true;
		text = prev_text;
		keyboard_string = prev_text;
		if (keyboard_check_pressed(vk_backspace)) {
			while (string_width(text) * scale > sprite_width * 0.92) text = string_delete(text, string_length(text), 1);
			keyboard_string = text;
			maxed = false;
			blinking = true;
			alarm[0] = blink_time;
		}
	} else {
		if (maxed) {
			maxed = false;
			blinking = true;
			alarm[0] = blink_time;
		}
		
		text = sanitise(keyboard_string);
	}
}

prev_text = text;