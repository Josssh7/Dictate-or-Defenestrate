draw_self();

//Draw Prompt Text
draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(AMBER);

var _x = (x+(sprite_width*0.5));
var _y = (y-25);
draw_text_transformed(_x, _y, prompt_text, scale, scale, 0);

//Draw Inputted Text
draw_set_font(fnt_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(TEXT_GRAY);
draw_text_transformed(floor(x+offsetx), floor(y), text, scale, scale, 0);

if (blinking) {
	//Position of end of text
	var _end = x + offsetx + (string_width(text) * scale);
	draw_set_color(TEXT_GRAY);
	draw_rectangle(_end, blink_top, _end+(blink_length*scale), blink_bottom, false);
}