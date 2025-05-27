vignette_struct = undefined;
edge_size = 1;
edge_rate = 0.04;
hue_struct = undefined;
hue_amount = 0;
hue_rate = edge_rate * 0.5;

next_room = undefined;

function transition(_room) {
	next_room = _room;
	global.transitioning = true;
	alarm[0] = 1;
}