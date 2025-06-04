event_inherited();

relative_pos = "left";
key = "commander";
if (check_dead(get_details())) {
	instance_destroy();
	exit;
}
sprite_index = get_details().sprite_data.sprite;

activity_text = "Diplomacy";
activity = function() {}

//get_details = function(){ return global.subs.commander };