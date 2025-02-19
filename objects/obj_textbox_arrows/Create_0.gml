event_inherited();
list = [];
index = 0;
prompt_text = "";

function set_list(_list) {
	list = _list;
	index = irandom(array_length(_list)-1);
}

function change_index(_inc) {
	index += _inc;
	//Handling wrap-arounds
	if (index < 0) index = array_length(list) - 1;
	else if (index > array_length(list) - 1) index = 0;
}

function randomize_index() {
	var _index = irandom(array_length(list)-1);
	//Generate until new index
	while (index == _index) _index = irandom(array_length(list)-1);
	index = _index;
}

//Creating arrows
instance_create_layer(x+(sprite_width*0.5), y-25, layer, obj_arrow, {
	inc : 1,
	textbox_id : id,
});
instance_create_layer(x+(sprite_width*0.5), y+25, layer, obj_arrow, {
	inc : -1,
	textbox_id : id,
	image_yscale : -1,
});