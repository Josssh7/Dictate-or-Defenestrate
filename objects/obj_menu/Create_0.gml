scale = 0.15;
margin = 70 * scale;
line_height = 140 * scale;

items = [];
gauges = {};
options = [];
description = undefined;
items_count = 0;

#macro HOVER_MARKER "* "
#macro COLON ": "
#macro LVL "LVL "

width = 0;
full_width = 0;
max_width = 350;
height = 0;
full_height = 0;

gauge_offset = 20;
gauge_width = 15;
icon_offset = 16;

options_buffer = 10;
options_height = 0;

hover = 0;
mouse_over = false;
mx_prev = device_mouse_x_to_gui(0);
my_prev = device_mouse_y_to_gui(0);

function draw_gauge(_x, _y, _val) {
	var _bottom = 3.25
	//Background
	draw_set_color(CADET_GRAY);
	draw_rectangle(_x, _y+2, _x+gauge_width-2, _y+full_height-_bottom, false);
	
	//Gauge bar
	var _color = AMBER; //50-99
	if (_val == 100) _color = LOVE_PINK; //Locked in
	else if (_val < 50) _color = CRIMSON; //25-50
	
	if (_val < 25) { //Mystify if too low
		draw_set_color(TEXT_GRAY);
		draw_rectangle(_x, _y+2, _x+gauge_width-2, _y+full_height-_bottom, false);
	} else {
		draw_set_color(_color);
		draw_rectangle(_x, _y+2+(full_height*(100-_val)*0.01), _x+gauge_width-2, _y+full_height-_bottom, false);
	}
	
	//Outline
	draw_sprite_stretched(spr_gauge, 0, _x, _y, gauge_width, full_height);
}