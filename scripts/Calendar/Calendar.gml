///@desc List of subs to be active for day
///@param {bool} _adv personal advisor
///@param {bool} _man appearance manager
///@param {bool} _prp propaganda minister
///@param {bool} _trs treasurer
///@param {bool} _com commander
function SubList(_adv, _man, _prp, _trs, _com) constructor {
	personal_advisor = _adv;
	appearance_manager = _man;
	propaganda_minister = _prp;
	treasurer = _trs;
	commander = _com;
}

#macro FULLSUBS new SubList(true, true, true, true, true)

//Declaring globals
global.calendar = [];
global.day = 0;
global.months = [
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December",
	"The End of Days"
]

///@desc Information for any given day
///@param {real} _day Day (1-37)
///@param {Struct} _month Month Struct
///@param {real} _year Year (19XX)
///@param {Struct} _subs SubList() struct (which are active)
///@param {function} _event Function to call for event
function Date(_day, _month, _year, _subs, _event) constructor {
	day  = _day;
	month = _month;
	year = _year;
	subs = _subs;
	event = _event;
}

///@desc Formats date to be displayed 
///@param {Struct} _date Date struct
function format_date(_date) {
	var _suffix = "th";
	switch (_date.day mod 10) {
		case 1:
			_suffix = "st";
		break;
		case 2:
			_suffix = "nd";
		break;
		case 3:
			_suffix = "rd";
		break;
	}
	return string(_date.day) + _suffix + " of " + global.months[_date.month] + " " + string(_date.year);
}

//Generate days
var _day = 28;
var _month = 10; //November
var _year = 1983;
var _empty = function() {} //Later have separate script for event methods

for (var i = 0; i < 100; i++) {
	//Handling loops
	if (_day+1 > 37) {
		_day = 1;
		if (_month+1 > 13) {
			_month = 0;
			_year++;
		}
		else _month++;
	}
	else _day++;
	
	array_push(global.calendar, new Date(_day, _month, _year, FULLSUBS, _empty));
}

//Set Specific Days Here
global.calendar[0].subs = new SubList(false, true, false, false, false);
global.calendar[1].subs = new SubList(false, true, true, false, false);
global.calendar[2].subs = new SubList(true, true, true, false, false);
global.calendar[3].subs = new SubList(true, true, true, true, true);