//@desc Draw the words
//More efficient to set draw parameters once here
draw_set_font(fnt_newspaper);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _words = layer_get_all_elements("Text");
for (var i = 0; i < array_length(_words); i++) {
	draw_set_color(c_black);
	with (layer_instance_get_instance(_words[i])) {
		if (!censored) {
			if (hover and !obj_censorship_manager.finished) draw_set_color(CRIMSON);
			draw_text(x, y, text);
		} else draw_rectangle(x, top, x+width, bottom, false);
	}
}

//Draw Photos
draw_sprite_stretched(photo1, 0, 90, 720, photo_length, photo_length);
draw_sprite_stretched(photo2, 0, 945, 1345, photo_length, photo_length);