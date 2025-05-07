if (censored) exit;
hover = point_in_rectangle(mouse_x, mouse_y, x, top, x+width, bottom);
if (mouse_check_button_pressed(mb_left) and hover) censored = true; 