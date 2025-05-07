censored = false;
hover = false;

draw_set_font(fnt_newspaper);
stroke_height = 25;
width = string_width(text);
var _y_middle = string_height(text) * 0.5;

top = y + _y_middle - (stroke_height * 0.5);
bottom = y + _y_middle + (stroke_height * 0.5);

//function check_censored() {
//	draw_set_font(fnt_newspaper);
//	var _strokes = obj_marker.strokes;
//	for (var i = 0; i < array_length(_strokes); i++) {
//		var _stroke = _strokes[i];
//		var _direction = 270 - point_direction(_stroke[0].x, _stroke[0].y, _stroke[1].x, _stroke[1].y); 
//		if ( (rectangle_in_triangle(
//					x, y,
//					x+string_width(text), y+string_height(text), 
//					_stroke[0].x, _stroke[0].y,
//					_stroke[1].x, _stroke[1].y,
//					_stroke[0].x+lengthdir_x(stroke_height, _direction), _stroke[0].y+lengthdir_x(stroke_height, _direction)) == 2)
//		and rectangle_in_triangle(
//					x, y,
//					x+string_width(text), y+string_height(text),
//					_stroke[0].x+lengthdir_x(stroke_height, _direction), _stroke[0].y+lengthdir_x(stroke_height,_direction),
//					_stroke[1].x, _stroke[1].y,
//					_stroke[1].x+lengthdir_x(stroke_height, _direction), _stroke[1].y+lengthdir_x(stroke_height, _direction)) == 2) return true;
//	}
//	return false;
//}