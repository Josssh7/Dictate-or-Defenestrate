name = "";
text = [];

#macro END "END"

scale = 0.15;
margin = 70 * scale;
line_height = 140 * scale;
line_count = 2; //Starts at 2 since always has name at top and buttons at bottom
indent = 100 * scale;

width = 0;
full_width = 0;
max_width = 500;
height = 0;
full_height = 0;

hover = 0;
mouse_over = false;
mx_prev = device_mouse_x_to_gui(0);
my_prev = device_mouse_y_to_gui(0);

previous_menu = noone;