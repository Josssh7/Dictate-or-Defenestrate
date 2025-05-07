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
			if (hover) draw_set_color(CRIMSON);
			draw_text(x, y, text);
		} else draw_rectangle(x, top, x+width, bottom, false);
	}
}