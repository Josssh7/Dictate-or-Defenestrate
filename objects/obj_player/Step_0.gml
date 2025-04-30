//Getting Input
if (obj_speech_manager.menu == noone) {
	key_duck = keyboard_check(vk_down) or keyboard_check(ord("S"));
	key_jump = keyboard_check(vk_up) or keyboard_check(ord("W"));
	key_jump_released = keyboard_check_released(vk_space) or keyboard_check_released(vk_up);
} else {
	key_duck = false;
	key_jump = false;
	key_jump_released = false;
}

state();

shake = max(shake - 1, 0);