draw_set_font(fnt_dialogue);
draw_set_color(c_white);

var _draw_angle = image_angle;
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (angle >= 180) { //For silly right side offset
	var _x = lengthdir_x(image_xscale*0.15, angle);
	var _y = lengthdir_y(image_yscale*0.15, angle);
	draw_text_transformed(x+_x, y+_y, text, scale, scale, _draw_angle);
}
else draw_text_transformed(x, y, text, scale, scale, _draw_angle);