margin = 5;
tab = 30;
line_height = 45;
text_height = 38;
rectangle_buffer = 5;
rectangle_height = 2;

resources_scale = 0.25;
item_scale = 0.35;

level = 0;
switch(global.status) {
	case "One-party System":
		level = 1;
		break;
	case "Head of Government":
		level = 2;
		break;
	case "Martial Law":
		level = 3;
		break;
	case "Absolute Power":
		level = 4;
		break;
}

hover = "";

items = [ //Impacts Support Rate
	{ text: "President", cost: { funds: 0, support: 0 } },
	{ text: "One-party System", cost: { funds: 15, support: 3 } },
	{ text: "Head of Government", cost: { funds: 20, support: 3 } },
	{ text: "Martial Law", cost: { funds: 30, support: 5 } },
	{ text: "Absolute Power", cost: { funds: 50, support: 5 } },
];

function can_buy() {
	if (global.funds - items[level+1].cost.funds < 0) return false;
	if (global.support - items[level+1].cost.support < 0) return false;
	return true;
}

function buy() {
	global.status = items[level+1].text;
	global.funds -= items[level+1].cost.funds;
	global.support -= items[level+1].cost.support;
	level++;
}