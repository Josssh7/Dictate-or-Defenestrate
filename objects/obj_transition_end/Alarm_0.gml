/// @description Blinking Out
edge_size = max(edge_size - edge_rate, 0);
fx_set_parameter(vignette_struct, "g_VignetteEdges", [edge_size, 2*edge_size]);

hue_amount = min(hue_amount + hue_rate, 0.5);
fx_set_parameter(hue_struct, "g_HueShift", hue_amount);

if (edge_size == 0) {
	global.transitioning = false;
	audio_stop_all();
	room_goto(next_room);
	instance_destroy();
} else alarm[0] = 1