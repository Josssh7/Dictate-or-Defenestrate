//Check Hover for BUY
draw_set_font(fnt_menu);
var _x = room_width-tab;
var _y = 50 + (line_height * (level + 1));
var _w = string_width("BUY") * item_scale;
if (point_in_rectangle(mouse_x, mouse_y, _x-_w, _y, _x, _y+text_height)) {
	hover = "buy";
	if (mouse_check_button_pressed(mb_left)) {
		if (can_buy()) buy();
	}
	exit;
}

//Check Hover for CONTINUE
_w = string_width("CONTINUE") * item_scale;
_y = room_height - margin;
if (point_in_rectangle(mouse_x, mouse_y, (room_width-_w)*0.5, _y-65, (room_width+_w)*0.5, _y-28)) {
	hover = "continue";
	if (mouse_check_button_pressed(mb_left)) obj_transition_end.transition(rm_review);
	exit;
}

hover = "";