///@description Fade to Black
fade_alpha = min(fade_alpha + 0.05, 1);
if (fade_alpha < 1) alarm[1] = 1;
else instance_deactivate_all(true);