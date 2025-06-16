event_inherited();

relative_pos = "right";
key = "treasurer";
if (check_dead(get_details())) {
	instance_destroy();
	exit;
}
sprite_index = get_details().sprite_data.sprite;

activity_text = "Manage Investments";
activity = function() { obj_transition_end.transition(rm_investments) }

//get_details = function(){ return global.subs.treasurer };