///@desc Draw Text
draw_set_color(c_white);
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(room_width*0.5, room_height*0.35, "YOUR INDECISION HURTS", 0.5, 0.5, 0);
draw_text_transformed(room_width*0.5, room_height*0.5, "THE MOTHERLAND", 0.5, 0.5, 0);

draw_text_transformed(room_width*0.5, room_height*0.8, "PRESS SPACE TO CONTINUE", 0.3, 0.3, 0);