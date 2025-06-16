if (get_clicked(self)) 
{
	menu_open = !menu_open;
	if (menu_open) {
		close_other_menus(id);
		on_click();
	}
	else close_menu(id);
	audio_play_sound(snd_click, 5, false);
}