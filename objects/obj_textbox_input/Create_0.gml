event_inherited();
typing = false;
text = "";
prompt_text = "";
other_id = -1;

blinking = false;
blink_time = 20;
blink_length = 50;
blink_height = 5;
blink_top = y + (font_get_size(fnt_dialogue) * scale * 0.5); //half since the pivot is in the middle
blink_bottom = blink_top + (blink_height * scale);

function turn_off() {
	blinking = false;
	alarm[0] = -1;
	text = string_trim_end(text);
}