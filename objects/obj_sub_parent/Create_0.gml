event_inherited();

relative_pos = "";
key = "";

activity_text = "";
activity = function() {}

get_details = function(){ return global.subs[$ key] };

//Adjusting Image Values for Sprites
image_xscale *= 0.5;
image_yscale *= 0.5;
thickness = 2;

report = noone;
report_text = function() { 
	var _details = get_details();
	//Will be on specific resources later once I add them :)
	return ["I wish I was doing " + string_lower(_details.likes[0]) + " right now."];
}

overlap = function() {
	var _ids = layer_get_all_elements("Items");
	for (var i = 0; i < array_length(_ids); i++) {
		if (get_hover(layer_instance_get_instance(_ids[i]))) { return true };
	}
	return false;
}

function display_details() {
	var _details = get_details();
	var _dir = relative_pos == "right" ? 1 : -1;
	menu = create_menu(75, 60, [
		new MenuItem("Role", [_details.role]),
		new MenuItem("Joined", [format_date(_details.joined)]),
		new MenuItem("Likes", _details.likes), //argument is an array just for this one fucking feature
		new MenuItem("Popularity", [string(_details.popularity) + "%"]),
		new MenuItem("Status", [calculate_status()]),
	], {trust: _details.trust, fear: _details.fear}, [new MenuOption("Get Report", display_report), new MenuOption(activity_text, activity)], _details.name, _dir);
}

function calculate_status() {
	var _details = get_details();
	if (_details.locked) return "Smitten";
	else if (_details.trust >= 75) return "Devoted";
	else if (_details.trust >= 50) return "Loyal";
	else return "Ambivalent";
}

function display_report() {
	var _details = get_details();
	report = create_report(275, 100, _details.name, report_text(), menu);
	instance_deactivate_object(menu);
}