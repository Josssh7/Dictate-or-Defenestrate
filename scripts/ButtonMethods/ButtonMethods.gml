function continue_game() {
	show_message("continue");
}

function load_game() {
	show_message("load");
}

function new_game() {
	initialise_globals();
	//Transition
	room_goto_next();
}