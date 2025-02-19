draw_self();

//Draw Text
draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(TEXT_GRAY);
draw_text_transformed(floor(x+(sprite_width*0.5)), floor(y), list[index], scale, scale, 0);