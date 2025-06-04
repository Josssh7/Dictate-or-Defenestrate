/// @description Draw Timer
var _seconds = max(0, floor(timer/30));
var _remainder = (timer/30) - floor(timer/30);
var _mills = max(0, round(_remainder*1000));
var _timer_text = string(_seconds) + ":" + string(_mills);

draw_set_color(c_white);
draw_set_font(fnt_timer);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(display_get_gui_width()-(string_width(_timer_text)+margin), margin, _timer_text);