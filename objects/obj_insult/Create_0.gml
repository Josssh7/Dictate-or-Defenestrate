event_inherited();

scale = 0.25;
collision_scale = 0.85; //hitbox not as big as appears

draw_set_font(fnt_dialogue);
image_angle = angle;
if (image_angle >= 180) image_angle -= 180;
image_xscale = string_width(text) * scale * collision_scale;
image_yscale = string_height(text) * scale * collision_scale;