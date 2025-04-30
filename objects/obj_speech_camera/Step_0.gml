cam_w = lerp(cam_w, full_width, zoom_rate);
cam_h = lerp(cam_h, full_height, zoom_rate);

camera_set_view_size(camera, cam_w, cam_h);

var _x = (room_width - cam_w) * 0.5;
var _y = (room_height - cam_h) * 0.5;
camera_set_view_pos(camera, _x, _y);

if (cam_w == full_width and cam_h == full_height and _x ==0  and _y == 0) instance_destroy();