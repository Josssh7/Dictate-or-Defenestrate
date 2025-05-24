margin = 15;
line_height = 35;

day_scale = 0.4;
stats_scale = 0.3;

day_text = "Day " + string(global.day + 1); //Since day is an index so starts from 0
stats_text = [ //Make into struct with value keyword for 0-2 (bad, normal, good)
	"Public Support: " + string(global.support) + "%",
	"GDP: $" + string(global.gdp) + "B",
	"Funds: $" + string(global.funds) + "K",
	"Subordinate Trust: " + string(get_sub_trust_amount()) + "/5",
	"Foreign Relations: " + "Peace",
	"Empire: " + string(global.empire) + "%"
];
stats_amount = array_length(stats_text);