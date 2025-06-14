margin = 15;
line_height = 35;

day_scale = 0.4;
stats_scale = 0.25;
action_scale = 0.2;

hover = "";
exit_text = "SAVE & EXIT";
continue_text = "CONTINUE";

stat = function(_text, _value, _units, _color) constructor {
	text = _text;
	value = _value;
	units = _units;
	color = _color;
}

day_text = "Day " + string(global.day + 1); //Since day is an index so starts from 0

//Initialising Stat Texts
#region
stats_text = [];

var _status_color = AMBER;
if (global.status == "Absolute Power") _status_color = c_green;
array_push(stats_text, new stat("Status: ", global.status, "", _status_color));

var _support_color = AMBER;
if (global.support >= 75) _support_color = c_green;
else if (global.support <= 25) _support_color = CRIMSON;
array_push(stats_text, new stat("Public Support: ", string(global.support), "%", _support_color));

var _gdp_color = AMBER;
if (global.gdp >= 10) _gdp_color = c_green;
else if (global.gdp <= 2) _gdp_color = CRIMSON;
array_push(stats_text, new stat("GDP: ", "$"+string(global.gdp), "B", _gdp_color));

var _funds_color = AMBER;
if (global.funds >= 100) _funds_color = c_green;
else if(global.funds <= 5) _funds_color = CRIMSON;
array_push(stats_text, new stat("Funds: ", "$"+string(global.funds), "K", _funds_color));

var _trust_color = AMBER;
var _trust_amount = get_sub_trust_amount();
if (_trust_amount == 5) _trust_color = c_green;
else if (_trust_amount <= 1) _trust_color = CRIMSON;
array_push(stats_text, new stat("Subordinate Trust: ", string(_trust_amount), "/5", _trust_color));

//Add later possibly (probably not, sorry sir :( )
//var _relations_color = AMBER;
//array_push(stats_text, new stat("Foreign Relations: ", "Peace", "", _relations_color));

var _enlistment_color = AMBER;
if (global.military >= 30) _enlistment_color = c_green;
else if (global.military <= 5) _enlistment_color = CRIMSON;
array_push(stats_text, new stat("Military Strength: ", string(global.military), "K", _trust_color));

var _empire_color = AMBER;
if (global.empire >= 50) _empire_color = c_green;
else if (global.empire <= 15) _empire_color = CRIMSON;
array_push(stats_text, new stat("Empire: ", string(global.empire), "%", _empire_color));
	
stats_amount = array_length(stats_text);
#endregion