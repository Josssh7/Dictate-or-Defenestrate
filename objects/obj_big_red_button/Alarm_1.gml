/// @description Fade from Black
fade_alpha = max(fade_alpha - 0.05, 0);
if (fade_alpha == 0) global.fading = false;
else alarm[1] = 1;