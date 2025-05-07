//for (var i = 0; i < array_length(strokes); i++) {
//	var _stroke = strokes[i];
//	var _angle = point_direction(_stroke[0].x, _stroke[0].y, _stroke[1].x, _stroke[1].y);
//	draw_sprite_ext(spr_particle, 0, _stroke[0].x, _stroke[0].y, max(abs(_stroke[1].x-_stroke[0].x), abs(_stroke[1].y-_stroke[0].y)), stroke_height, _angle, c_black, 1);
//}

//if (mouse_down) {
//	var _angle = point_direction(start_x, start_y, mouse_x, mouse_y);
//	draw_sprite_ext(spr_particle, 0, start_x, start_y, max(abs(mouse_x-start_x), abs(mouse_y-start_y)), stroke_height, _angle, c_black, 1);
//}

draw_sprite_ext(spr_marker, 0, mouse_x, mouse_y, 2, 2, 0, c_white, 0.5);