function explode() {
	instance_destroy();
	audio_play_sound(explosion_sound, 10, false);
	for (var i = 0; i < 360; i += 45) {
		instance_create_depth(x, y, -10, obj_particle, {
			image_blend : color,
			image_xscale : 4,
			image_yscale : 4,
			speed : 4,
			direction : i,
		});
	}
}

alarm[0] = 300;