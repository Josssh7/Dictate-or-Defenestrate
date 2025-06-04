event_inherited();

relative_pos = "right";
key = "propaganda_minister";
if (check_dead(get_details())) {
	instance_destroy();
	exit;
}
sprite_index = get_details().sprite_data.sprite;

activity_text = "Censor Media";
activity = function() { obj_transition_end.transition(rm_censorship) }