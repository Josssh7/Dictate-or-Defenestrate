margin = 5;
tab = 30;
line_height = 45;
text_height = 45;

resources_scale = 0.25;
item_scale = 0.4;
action_scale = 0.35;

hover = "";

items = [ //Impacts Support Rate
	{ text: "Military", cost: { funds: 8, resource: "military", sub: "commander", amount: 10 } },
	{ text: "Media", cost: { funds: 5, resource: "support_rate", sub: "propaganda_minister", amount: 1 } },
	{ text: "Infrastructure", cost: { funds: 5, resource: "gdp_rate", sub: "appearance_manager", amount: 1 } },
	{ text: "Economy", cost: { funds: 3, resource: "funds_rate", sub: "treasurer", amount: 1 } },
];

function can_buy(_index) {
	if (global.funds - items[_index].cost.funds < 0) return false;
	else return true;
}

function buy(_index) {
	global.funds -= items[_index].cost.funds;
	global[$ items[_index].cost.resource] = global[$ items[_index].cost.resource] + items[_index].cost.amount;
	global.subs[$ items[_index].cost.sub].trust = global.subs[$ items[_index].cost.sub].trust + items[_index].cost.amount;
}