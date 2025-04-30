//Constants
g = 1.5; //Gravity is a preset variable so can't use that :(
initial_jump_speed = -17.5;
initial_shake = 10;
base_y = y;

//Variables
jump_speed = 0;
shake = 0

//Inputs
key_jump = false;
key_duck = false;
key_jump_released = false;

//Methods
function jump() {
	jump_speed = initial_jump_speed;
	audio_play_sound(snd_jump, 10, false);
}

function hit() {
	shake = initial_shake;
	obj_speech_manager.topic_score -= 1;
}

//States
#region
state_standing = function() {
	if (key_duck) enter_state("ducking");
	else if (key_jump) enter_state("jumping");
}

state_ducking = function() {
	if (!key_duck) enter_state("standing");
	else if (key_jump) enter_state("jumping");
}

state_jumping = function() {
	if (key_jump_released and jump_speed < 0) jump_speed *= 0.5; //Cut velocity on release
	
	if (jump_speed >= 0) jump_speed += g * 2.5; //Stronger on fall
	else jump_speed += g;
	
	if (y + jump_speed >= base_y) {
		y = base_y;
		if (key_jump) jump();
		else enter_state("standing");
	}
	else y += jump_speed;
}

function enter_state(_state) {
	switch(_state) {
		case "standing": 
			state = state_standing;
			sprite_index = spr_player_standing;
			break;
		
		case "ducking":
			state = state_ducking;
			sprite_index = spr_player_ducking;
			break;
			
		case "jumping":
			state = state_jumping;
			jump();
			sprite_index = spr_player_jumping;
			break;
	}
}

state = state_standing;
#endregion