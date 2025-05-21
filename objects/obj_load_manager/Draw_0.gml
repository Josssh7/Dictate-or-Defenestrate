draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);	
draw_set_font(fnt_propaganda);

draw_text_transformed(room_width*0.5, room_height*0.15, menu.options[menu.hover].info.prompt, 1.25, 1.25, 0); 