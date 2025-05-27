//Make sure not paused!
if (input_ok()) timer--;

if (fade_alpha == 1 and keyboard_check_pressed(vk_space)) room_goto(rm_review);