event_inherited();

relative_pos = "";
menu_open = false;
menu = noone;

overlap = function() {
	var _ids = layer_get_all_elements("Instances");
	for (var i = 0; i < array_length(_ids); i++) {
		if (get_hover(layer_instance_get_instance(_ids[i]))) { return true };
	}
	return false;
}

get_details = function(){ return {} };

function display_details() {
	var _details = get_details();
	var _dir = relative_pos == "right" ? 1 : -1;
	menu = create_menu(75, 60, [
		new MenuItem("Role", [_details.role]),
		new MenuItem("Joined", [format_date(_details.joined)]),
		new MenuItem("Likes", _details.likes), //argument is an array just for this one fucking feature
		new MenuItem("Popularity", [string(_details.popularity) + "%"]),
		new MenuItem("Status", ["ADD LATER"]),
	], {trust: _details.trust, fear: _details.fear}, _details.name, _dir);
}

function close_details() {
	menu_open = false; //Important for pressing escape key
	obj_camera_zoom.reset_target();
	if (menu != noone) {
		instance_destroy(menu);
		menu = noone;
	}
}