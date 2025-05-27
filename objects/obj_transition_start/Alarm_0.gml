/// @description Blinking In
edge_size = min(edge_size + edge_rate, 1);
fx_set_parameter(vignette_struct, "g_VignetteEdges", [edge_size, 2*edge_size]);

hue_amount = max(hue_amount - hue_rate, 0);
fx_set_parameter(hue_struct, "g_HueShift", hue_amount);

if (edge_size == 1) {
	global.transitioning = false;
	start_method();
	instance_destroy();
} else alarm[0] = 1