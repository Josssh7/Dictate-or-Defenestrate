menu = noone;

menu = create_select_menu(room_width*0.5, room_height*0.35, [
	new SelectOption({text: "CONTINUE", prompt: "Continue from Last Save File"}, continue_game),
	new SelectOption({text: "NEW", prompt: "Start a New Save File"}, new_game),
	new SelectOption({text: "LOAD", prompt: "Load Game from Save File"}, load_game),
	], 0.35, "center");