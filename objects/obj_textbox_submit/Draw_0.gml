draw_self();

draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (get_hover(self)) draw_set_color(AMBER);
else draw_set_color(CRIMSON);
draw_text_transformed(floor(x+(sprite_width*0.5)), floor(y), "SUBMIT", scale, scale, 0);