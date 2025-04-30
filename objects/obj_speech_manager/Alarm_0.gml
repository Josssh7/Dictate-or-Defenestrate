/// @description Menu 2
reset_text();
if (menu_index == 3) {
	alarm[1] = 1;
	apply_score();
} else {
	var _options = array_shuffle(dialogue[$ topic][menu_index].options);
	menu = create_select_menu(room_width*0.5, room_height * 0.5, [ 
								new SelectOption({index: menu_index, text: _options[0].text, value: _options[0].value}, select_option),
								new SelectOption({index: menu_index, text: _options[1].text, value: _options[1].value}, select_option),
								new SelectOption({index: menu_index, text: _options[2].text, value: _options[2].value}, select_option)], 0.15, "center", "Fill in the Blank");
							
	prompt_text = dialogue[$ topic][menu_index].line;
	menu_index++;
}