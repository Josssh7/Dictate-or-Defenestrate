///@desc 
camera = view_camera[0];
zoom_spd = 0.2;
zoom_scale = 0.4;
pan_spd = 0.2;
margin = 25; //Already considering zoom_scale
mouse_offset = 6;

var _w = camera_get_view_width(camera);
var _h = camera_get_view_height(camera);
cam_w = _w;
cam_h = _h;
zoom_w = _w * zoom_scale;
zoom_h = _h * zoom_scale;
cam_x = camera_get_view_x(camera);
cam_y = camera_get_view_y(camera);

target = {x: cam_x, y: cam_y};
zooming = false;

///@desc Sets new target as struct considering if its to the left, right or center
function new_target(_target, _pos = "") {
	var _w = camera_get_view_width(camera);
	var _x = cam_x;
	
	//Adjusting for different positions
	if (_pos == "left") _x = _target.x - (zoom_w - margin);
	else if (_pos == "right") _x = _target.x - margin;
	else _x = _target.x - (zoom_w * 0.5);
	
	target.x = clamp(_x, 0, room_width);
	target.y = clamp(_target.y - (zoom_h * 0.5), 0, room_height);
	zooming = true;
}
 
function reset_target() { 
	target = {x: cam_x, y: cam_y};
	zooming = false;
}
//mouse always pans, even during zoom, just adds a little bit