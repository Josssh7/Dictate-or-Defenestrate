///@description Hover / Selected Outline
if (get_hover(self) and !overlap()) {
	if (keyboard_check(vk_shift) and layer == layer_get_id("Subordinates")) setup_shader(select_color);
	else setup_shader(outline_color);
}
else if (selected) setup_shader(select_color);
else draw_self();