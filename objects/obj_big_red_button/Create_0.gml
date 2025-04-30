event_inherited();

scream_countdown = -1;
scream_buffer = 40;

fade_alpha = 0;
global.fading = false;

on_click = function() {
	var _ids = layer_get_all_elements("Subordinates");
	var _victims = 0;
	for (var i = 0; i < array_length(_ids); i++) {
		var _sub = layer_instance_get_instance(_ids[i]);
		if (_sub.selected) {
			kill_sub(_sub.key);
			instance_destroy(_sub);
			
			//Visuals
			alarm[0] = 1;
			global.fading = true;
			
			//Audio
			_victims++;
			if (_victims == 1) alarm[2] = 5;
		}
		scream_countdown = _victims * scream_buffer - 1;  //so not 1 extra time
	}
}