if (keyboard_check(vk_space)) speak_rate = 1;
else speak_rate = 3;

if (text_index != string_length(full_text) + 1 and speak_count != -1) {
	if (speak_count == 0) {
		display_text += string_char_at(full_text, text_index);
		text_index++;
		if (text_index == string_length(full_text) + 1) { //Finished
			alarm[0] = 30;
		} else speak_count = speak_rate;
	
		for (var i = 0; i < array_length(attacks); i++) {
			if (attacks[i].signal == text_index) {
				create_projectile(attacks[i].attack);
				audio_play_sound(snd_projectile_spawn, 10, false);
				break;
			}
		}
	} else speak_count = max(speak_count - 1, -1);
}

if (fade_alpha == 1 and keyboard_check_pressed(vk_space)) game_end();