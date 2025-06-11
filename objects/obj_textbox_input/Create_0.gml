event_inherited();
typing = false;
text = "";
prev_text = text;
prompt_text = "";
other_id = -1;

maxed = false;
blinking = false;
blink_time = 20;
blink_length = 50;
blink_height = 5;
blink_top = y + (font_get_size(fnt_dialogue) * scale * 0.5); //half since the pivot is in the middle
blink_bottom = blink_top + (blink_height * scale);

function sanitise(_string) {
	_string = string_upper(_string);
	var _new_string = "";
	for(var i = 1; i <= string_length(_string); ++i) {
		var _char =  string_char_at(_string, i);
	    if (string_pos(_char, "ABCDEFGHIJKLMNOPQRSTUVWXYZ") != 0 ) _new_string += _char;
	}
	return _new_string;
}

function turn_off() {
	blinking = false;
	alarm[0] = -1;
	text = string_trim_end(text);
}

function check_empty() { return string_trim(text) == "" }