event_inherited();

relative_pos = "";
key = "";

overlap = function() {
	var _ids = layer_get_all_elements("Items");
	for (var i = 0; i < array_length(_ids); i++) {
		if (get_hover(layer_instance_get_instance(_ids[i]))) { return true };
	}
	return false;
}

get_details = function(){ return global.subs[$ key] };

function display_details() {
	var _details = get_details();
	var _dir = relative_pos == "right" ? 1 : -1;
	menu = create_menu(75, 60, [
		new MenuItem("Role", [_details.role]),
		new MenuItem("Joined", [format_date(_details.joined)]),
		new MenuItem("Likes", _details.likes), //argument is an array just for this one fucking feature
		new MenuItem("Popularity", [string(_details.popularity) + "%"]),
		new MenuItem("Status", ["ADD LATER"]),
	], {trust: _details.trust, fear: _details.fear}, _details.activity, _details.name, _dir);
}