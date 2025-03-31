///@description Hover Outline
if (get_hover(self) and !overlap()) {
	shader_set(sh_outline);
	shader_set_uniform_f(upixel_w, texel_w);
	shader_set_uniform_f(upixel_h, texel_h);
	shader_set_uniform_f(uoutline_thickness, thickness);
	shader_set_uniform_f_array(uoutline_color, color);
	
	draw_self();
	shader_reset();
}
else draw_self();