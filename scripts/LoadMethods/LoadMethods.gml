function save_game() {
	var _save_data = {
		name : global.name,
		party: global.party,
		scapegoat: global.scapegoat,
		start_skill: global.start_skill,
		subs: global.subs,

		support: global.support,
		support_rate: global.support_rate,
		gdp: global.gdp,
		gdp_rate: global.gdp_rate,
		empire: global.empire,
		military: global.military,
		funds: global.funds,
		funds_rate: global.funds_rate,
	
		calendar: global.calendar,
		day: global.day,
	}
	var _string = json_stringify(_save_data);
	var _file = file_text_open_write("save.txt");
	file_text_write_string(_file, _string);
	file_text_close(_file);
}

function continue_game() {
		if (file_exists("save.txt")) {
		var _file = file_text_open_read("save.txt");
		var _json = file_text_read_string(_file);
		var _save_data = json_parse(_json);
		
		global.name = _save_data.name;
		global.party = _save_data.party;
		global.scapegoat = _save_data.scapegoat;
		global.start_skill = _save_data.start_skill;
		global.subs = _save_data.subs;

		global.support = _save_data.support;
		global.support_rate = _save_data.support_rate;
		global.gdp = _save_data.gdp;
		global.gdp_rate = _save_data.gdp_rate;
		global.empire = _save_data.empire;
		global.military = _save_data.military;
		global.funds = _save_data.funds;
		global.funds_rate = _save_data.funds_rate;
	
		global.calendar = _save_data.calendar;
		global.day = _save_data.day;
		
		file_text_close(_file);
		
		room_goto(rm_meeting);
	} else show_message("FILE NOT FOUND :( \nMake sure your file is saved under the name 'save.txt'.");
}

function new_game() {
	initialise_globals();
	room_goto(rm_customise);
}