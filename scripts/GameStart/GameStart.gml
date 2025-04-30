#macro AMBER make_color_rgb(255, 190, 11)
#macro CADET_GRAY make_color_rgb(147, 168, 172)
#macro CRIMSON make_color_rgb(163, 22, 33)
#macro DARK_PURPLE make_color_rgb(42, 31, 45)
#macro TEXT_GRAY make_color_rgb(200, 200, 200)
#macro LOVE_PINK make_color_rbg(255, 102, 204)

global.name = "";
global.party = "";
global.scapegoat = "";

global.support = 0; //Percentage
global.support_rate = 0;
global.gdp = 0; //Million (currency?)
global.gdp_rate = 0;
global.empire = 0; //Percentage 
global.funds = 0; //1000s (k)
global.funds_rate = 0;

global.start_skill = 0;
global.subs = {}

if os_browser == browser_not_a_browser
   {
  //not in browser
   }
else {
	window_set_size(browser_width, browser_height); //Take up full screen space
	display_set_gui_size(640, 360);
}