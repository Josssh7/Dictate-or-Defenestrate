///@description Hover Outline
var _x = mouse_x * calibrate_window_x();
var _y = mouse_y * calibrate_window_y();

if (position_meeting(_x, _y, self)) {
	shader_set(sh_outline);
	shader_set_uniform_f(upixel_w, texel_w);
	shader_set_uniform_f(upixel_h, texel_h);
	draw_self();
	shader_reset();
}
else draw_self();