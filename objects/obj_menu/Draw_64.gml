draw_set_color(c_white);

//Draw Menu Background
draw_sprite_stretched(spr_textbox, 0, x-margin, y-margin, full_width, full_height);

//Draw Gauges
var _y = y - margin;
if (dir == 1) { //To the right
	var _x = x + full_width + gauge_offset - (margin * 2);
	draw_sprite(spr_trust_icon, 0, _x, _y - icon_offset);
	draw_sprite(spr_deceit_icon, 0, _x, _y + full_height);
	draw_gauge(_x, _y, gauges.trust);
	
	_x += gauge_offset;
	draw_sprite(spr_fear_icon, 0, _x, _y - icon_offset);
	draw_sprite(spr_ambition_icon, 0, _x, _y + full_height);
	draw_gauge(_x, _y, gauges.fear);
}
else if (dir == -1) {//To the left, if no gauge we probably need another parameter :(
	var _x = x - (margin + gauge_offset);
	draw_sprite(spr_trust_icon, 0, _x, _y - icon_offset);
	draw_sprite(spr_deceit_icon, 0, _x, _y + full_height);
	draw_gauge(_x, _y, gauges.trust);
	
	_x -= gauge_offset;
	draw_sprite(spr_fear_icon, 0, _x, _y - icon_offset);
	draw_sprite(spr_ambition_icon, 0, _x, _y + full_height);
	draw_gauge(_x, _y, gauges.fear);
}


//Draw Text
draw_set_font(fnt_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _desc = (description != -1); //Bool check if there is a description
var _lines = 0;
for (var i = 0; i < (items_count + _desc); i++) {
	draw_set_color(c_white); //So individual changes don't impact others
	if (i==0 and _desc) {
		draw_set_color(CADET_GRAY);
		draw_text_transformed(x, y, description, scale, scale, 0);
		_lines++;
	}
	else {
		var _item = items[i-_desc]
		var _str = _item.name + COLON + _item.info[0]; //Reduced if desc since options doesn't include desc
		draw_text_transformed(x, y + (_lines * line_height), _str, scale, scale, 0);
		_lines++
		var _len = array_length(_item.info);
		if (_len > 1) { //If multiple info bits
			var _offset = string_width(_item.name + COLON);
			for (var j = 1; j < _len; j++) {
				draw_text_transformed(x+(_offset*scale), y+(_lines*line_height), _item.info[j], scale, scale, 0);
				_lines++;
			}
		}
	}
}