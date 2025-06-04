event_inherited();

relative_pos = "left";
key = "appearance_manager";
if (check_dead(get_details())) {
	instance_destroy();
	exit;
}
sprite_index = get_details().sprite_data.sprite;

activity_text = "Public Speech";
activity = function() { obj_transition_end.transition(rm_speech) }