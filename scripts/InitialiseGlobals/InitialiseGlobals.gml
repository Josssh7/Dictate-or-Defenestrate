function initialise_globals() {
	global.name = "";
	global.party = "";
	global.scapegoat = "";

	global.support = 30; //Percentage
	global.support_rate = -1;
	global.gdp = random_range(3, 3.2); //Million (currency?)
	global.gdp_rate = 0.05;
	global.empire = 5; //Percentage 
	global.funds = 20; //1000s (k)
	global.funds_rate = 5;

	global.start_skill = 10;
	global.subs = initialise_subs();
}