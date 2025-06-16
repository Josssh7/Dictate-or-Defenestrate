//Check Hover for BUY
draw_set_font(fnt_menu);
var _x = room_width - tab;
for (var i = 0; i < array_length(items); i++) {
	var _y = 50 + (line_height * i);
	var _w = string_width("BUY $5") * item_scale;

	if (point_in_rectangle(mouse_x, mouse_y, _x-_w, _y, _x, _y+text_height)) {
		hover = string(i);
		if (mouse_check_button_pressed(mb_left)) {
			if (can_buy(i)) buy(i);
		}
		exit;
	}
}

//Check Hover for CONTINUE
var _w = string_width("CONTINUE") * action_scale;
var _y = room_height - margin;
if (point_in_rectangle(mouse_x, mouse_y, (room_width-_w)*0.5, _y-65, (room_width+_w)*0.5, _y-28)) {
	hover = "continue";
	if (mouse_check_button_pressed(mb_left)) obj_transition_end.transition(rm_review);
	exit;
}

hover = "";