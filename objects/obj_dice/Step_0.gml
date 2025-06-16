//Hover
if (get_hover(self)) image_index = 1;
else image_index = 0;

//Click
if (get_clicked(self)) {
	randomize_fields();
	audio_play_sound(snd_dice, 8, false);
}