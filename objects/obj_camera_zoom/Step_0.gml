var _w = camera_get_view_width(camera);
var _h = camera_get_view_height(camera);
var _x = camera_get_view_x(camera);
var _y = camera_get_view_y(camera);

if (keyboard_check_released(vk_escape) and input_ok()) reset_target();

//Panning
var _dir = point_direction(_x+(camera_get_view_width(camera)*0.5), _y+(camera_get_view_height(camera)*0.5), mouse_x, mouse_y);
_x = lerp(_x, target.x + lengthdir_x(mouse_offset, _dir), pan_spd);
_x = clamp(_x, 0, room_width);
_y = lerp(_y, target.y + lengthdir_y(mouse_offset, _dir), pan_spd);
_y = clamp(_y, 0, room_height);

camera_set_view_pos(camera, _x, _y);

//Zooming
if (!zooming) { //Return to normal
	_w = lerp(_w, cam_w, zoom_spd);
	_h = lerp(_h, cam_h, zoom_spd);
}
else { //Lerp to zoom size
	_w = lerp(_w, zoom_w, zoom_spd);
	_h = lerp(_h, zoom_h, zoom_spd);
}

camera_set_view_size(camera, _w, _h);