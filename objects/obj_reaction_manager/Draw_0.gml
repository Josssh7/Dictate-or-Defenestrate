if (reaction_sprite != undefined) {
	for (var i = 0; i < reaction_rate; i++) {
		//Higher probability in browser
		var _num = (os_browser == browser_not_a_browser) ? 4 : 12;
		if (irandom(_num) != _num) continue;
		var _scale = random_range(0.8, 1);
		instance_create_layer(
			random_range(0, room_width), 
			random_range(room_height*0.25, room_height*0.65),
			layer, 
			obj_reaction,
			{
				sprite_index: reaction_sprite,
				image_xscale: _scale,
				image_yscale: _scale,
			});
	}
}