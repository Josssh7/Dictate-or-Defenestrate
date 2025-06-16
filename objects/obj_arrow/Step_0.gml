if (get_hover(self)) image_index = 1;
else image_index = 0;

//When clicked
if (get_clicked(self)) {
	textbox_id.change_index(inc);
	audio_play_sound(snd_click, 5, false);
}