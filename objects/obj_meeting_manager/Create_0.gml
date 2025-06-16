switch (global.day) {
	case 0:
		global.subs.appearance_manager = new Subordinate("Public Appearance Manager");
		break;
	case 1:
		global.subs.propaganda_minister = new Subordinate("Propaganda Minister");
		break;
	case 2:
		global.subs.personal_advisor = new Subordinate("Personal Advisor");
		break;
	case 3:
		global.subs.treasurer = new Subordinate("Treasurer");
		global.subs.commander = new Subordinate("Commander-in-chief");
		break;
}

var _subs = global.calendar[global.day].subs;
if !(_subs.personal_advisor) instance_destroy(obj_personal_advisor);
if !(_subs.appearance_manager) instance_destroy(obj_appearance_manager);
if !(_subs.propaganda_minister) instance_destroy(obj_propaganda_minister);
if !(_subs.treasurer) instance_destroy(obj_treasurer);
if !(_subs.commander) instance_destroy(obj_commander);

timer = 60 * 30;
margin = 5;