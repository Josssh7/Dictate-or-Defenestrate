draw_set_font(fnt_menu);
draw_set_valign(fa_top);

//Draw Resources Text
draw_set_color(c_white);
draw_set_halign(fa_left);
if (hover == "buy") {
	draw_text_transformed(margin, 0, "Funds: ", resources_scale, resources_scale, 0);
	draw_set_halign(fa_right);
	draw_text_transformed(room_width-(margin+41), 0, "Public Support: ", resources_scale, resources_scale, 0);
	if (can_buy()) {
		draw_set_color(AMBER);
		draw_set_halign(fa_left);
		draw_text_transformed(margin+(string_width("Funds: ")*resources_scale), 0, string(global.funds-items[level+1].cost.funds) + "K", resources_scale, resources_scale, 0);
		draw_set_halign(fa_right);
		draw_text_transformed(room_width-margin, 0, string(global.support-items[level+1].cost.support) + "%", resources_scale, resources_scale, 0);
	} else {
		draw_set_color(CRIMSON);
		draw_set_halign(fa_left);
		draw_text_transformed(margin+(string_width("Funds: ")*resources_scale), 0, string(global.funds) + "K", resources_scale, resources_scale, 0);
		draw_set_halign(fa_right);
		draw_text_transformed(room_width-margin, 0, string(global.support) + "%", resources_scale, resources_scale, 0);
	}
}
else {
	draw_text_transformed(margin, 0, "Funds: " + string(global.funds) + "K", resources_scale, resources_scale, 0);
	draw_set_halign(fa_right);
	draw_text_transformed(room_width-margin, 0, "Public Support: " + string(global.support) + "%", resources_scale, resources_scale, 0);
}

//Draw Items
draw_set_halign(fa_left);
for (var i = 0; i < array_length(items); i++) {
	draw_set_color(c_white);
	var _text = "+ " + items[i].text;
	var _y = 50 + (line_height * i);
	
	//Draw Text
	if (i > level + 1) draw_set_color(c_gray);
	draw_text_transformed(tab, _y, _text, item_scale, item_scale, 0);
	
	//Draw BUY
	if (i == level + 1) {
		if (hover == "buy") {
			if (can_buy()) draw_set_color(AMBER);
			else draw_set_color(CRIMSON);
		}
		draw_set_halign(fa_right);
		draw_text_transformed(room_width-tab, _y, "BUY", item_scale, item_scale, 0);
		draw_set_halign(fa_left);
	}
	
	//Strikethrough
	if (i <= level) {
		var _rect_x = tab - rectangle_buffer;
		var _rect_y = _y + (line_height * 0.5);
		draw_set_color(CRIMSON);
		draw_rectangle(_rect_x, _rect_y, _rect_x+(string_width(_text)*item_scale)+rectangle_buffer, _rect_y+rectangle_height, false);
	}
}

//Draw Continue Text
draw_set_color(c_white);
if (hover == "continue") draw_set_color(AMBER);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_transformed(room_width*0.5, room_height-margin, "CONTINUE", item_scale, item_scale, 0);