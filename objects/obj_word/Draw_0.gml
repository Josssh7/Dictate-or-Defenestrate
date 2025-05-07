//draw_set_font(fnt_newspaper);
//draw_set_color(c_black);
//if (!censored) {
//	//if check_censored() draw_set_color(c_red);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	if (hover) draw_set_color(CRIMSON);
//	draw_text(x, y, text);
//} else draw_rectangle(x, y, x+string_width(text), y+string_height(text), false);

//draw_set_color(c_aqua);
//	var _x = x + (string_width(text) * 0.5);
//	var _y = y + (string_height(text) * 0.5);
//	var _strokes = obj_marker.strokes;
//	for (var i = 0; i < array_length(_strokes); i++) {
//		var _stroke = _strokes[i];
//		var _direction = 270 - point_direction(_stroke[0].x, _stroke[0].y, _stroke[1].x, _stroke[1].y); 
//		draw_triangle(
//					_stroke[0].x, _stroke[0].y,
//					_stroke[1].x, _stroke[1].y,
//					_stroke[0].x+lengthdir_x(stroke_height, _direction), _stroke[0].y+lengthdir_x(stroke_height, _direction), false);
//		draw_triangle(
//					_stroke[0].x+lengthdir_x(stroke_height, _direction), _stroke[0].y+lengthdir_x(stroke_height,_direction),
//					_stroke[1].x, _stroke[1].y,
//					_stroke[1].x+lengthdir_x(stroke_height, _direction), _stroke[1].y+lengthdir_x(stroke_height, _direction), false);
//	}
//	draw_set_color(c_red);
//	draw_rectangle(_x-1, _y-1, _x+1, _y+1, false);