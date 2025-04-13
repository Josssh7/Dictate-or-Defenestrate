event_inherited();

if (scream_countdown mod scream_buffer == 0) audio_play_sound(snd_wilhelm_scream, 9, false, 1, 0, random_range(0.8, 1.2)); 
scream_countdown = max(scream_countdown - 1, -1);