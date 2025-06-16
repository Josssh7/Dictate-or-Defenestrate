draw_set_color(c_white);
draw_set_font(fnt_menu);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//Draw Resources Text
if (hover != "" and hover != "continue") {
	draw_text_transformed(margin, 0, "Funds: ", resources_scale, resources_scale, 0);
	var _index = int64(hover);
	if (can_buy(_index)) {
		draw_set_color(AMBER);
		draw_text_transformed(margin+(string_width("Funds:  ")*resources_scale), 0, string(global.funds-items[_index].cost.funds) + "K", resources_scale, resources_scale, 0);
	} else {
		draw_set_color(CRIMSON);
		draw_text_transformed(margin+(string_width("Funds:  ")*resources_scale), 0, string(global.funds) + "K", resources_scale, resources_scale, 0);
	}
}
else {
	draw_text_transformed(margin, 0, "Funds: " + string(global.funds) + "K", resources_scale, resources_scale, 0);
}

//Draw Items
draw_set_halign(fa_left);
for (var i = 0; i < array_length(items); i++) {
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var _text = "+ " + items[i].text;
	var _y = 50 + (line_height * i);
	
	//Draw Item
	draw_text_transformed(tab, _y, _text, item_scale, item_scale, 0);
	
	//Draw BUY
	if (hover == string(i)) {
		if (can_buy(i)) draw_set_color(AMBER);
		else draw_set_color(CRIMSON);
	}
	draw_set_halign(fa_right);
	draw_text_transformed(room_width-tab, _y, "BUY " + string(items[i].cost.funds), item_scale, item_scale, 0);
}

//Draw Continue Text
draw_set_color(c_white);
if (hover == "continue") draw_set_color(AMBER);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_transformed(room_width*0.5, room_height-margin, "CONTINUE", action_scale, action_scale, 0);