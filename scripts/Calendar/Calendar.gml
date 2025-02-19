///@desc List of subs to be active for day
///@param {bool} _adv personal advisor
///@param {bool} _man appearance manager
///@param {bool} _prp propaganda minister
///@param {bool} _trs treasurer
///@param {bool} _com commander
function SubList(_adv, _man, _prp, _trs, _com) constructor {
	personal_advisor = _adv;
	appearance_manager = _man;
	propagana_minister = _prp;
	treasurer = _trs;
	commander = _com;
}

#macro FULLSUBS new SubList(true, true, true, true, true)


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

global.calendar = [];
global.day = 0;

//Generate days
var _day = 28;
var _month = 10; //November
months = [
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
	"End of Days"
]
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
		else month++;
	}
	else _day++;
	
	array_push(global.calendar, new Date(_day, _month, _year, FULLSUBS, _empty));
}

//Then set specific days here