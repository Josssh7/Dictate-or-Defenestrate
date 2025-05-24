/// @description Fade to Black
fade_alpha = min(fade_alpha + 0.05, 1);
if (fade_alpha == 1) {
	for (var i = 0; i < array_length(kill_list); i++) instance_destroy(kill_list[i]);
	kill_list = [];
	alarm[1] = scream_countdown + 25;
}
else alarm[0] = 1;