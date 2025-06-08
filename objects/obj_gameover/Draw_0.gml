draw_set_font(fnt_menu);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);


//Gameover Message
draw_text_transformed(room_width*0.5, room_height*0.2, "GAME OVER", 0.35, 0.35, 0);

draw_set_color(CRIMSON);
if (variable_global_exists("gameover_message")) draw_text_transformed(room_width*0.5, room_height*0.4, global.gameover_message, 0.45, 0.45, 0);

//Action Text
draw_set_valign(fa_bottom);

var _color = (hover == "restart") ? AMBER : c_white;
draw_set_color(_color);
draw_text_transformed(room_width/3, room_height*0.85, restart_str, action_scale, action_scale, 0);

_color = (hover == "exit") ? AMBER : c_white;
draw_set_color(_color)
draw_text_transformed(room_width*2/3, room_height*0.85, exit_str, action_scale, action_scale, 0);