///@desc option struct format
///@param {string} _name Option name
///@param {array} _info Array of info bits
function MenuItem(_name, _info) constructor {
	name = _name;
	info = _info;
}

function MenuOption(_name, _onclick) constructor {
	name = _name;
	onclick = _onclick;
}

function SelectOption(_info, _onclick) constructor {
	info = _info;
	onclick = _onclick;
}

function create_menu(_x, _y, _items, _gauges, _options, _description = -1, _dir = 1) {
	var _menu = instance_create_depth(_x, _y, -999, obj_menu);
	with (_menu) { 
		items = _items;
		gauges = _gauges;
		options = _options;
		description = _description;
		dir = _dir;
		if (dir == 1) x += 175;
		items_count = array_length(_items);
		options_count = array_length(_options);
		info_count = 0; //Extra info bits to add to height
		
		//Sets width as longest string
		//DO NOT LET OPTIONS BE LONGER THAN MAIN/MAX
		width = 1;
		draw_set_font(fnt_menu); //For string_width measurements
		if (_description != -1) width = max(width, scale * string_width(_description));
		for (var i = 0; i < items_count; i++) {
			//Get largest info bit
			var _max = 0;
			//Format for width
			items[i].info = split_string_by_width(items[i].info, max_width-(scale*string_width(items[i].name + COLON)), scale);
			for (var j = 0; j < array_length(items[i].info); j++) {
				_max = max(_max, string_width(items[i].info[j]));
				if (j > 0) info_count++; //add for extra lines from info bits
			}
			//Get largest line
			width = max(width, scale * (string_width(items[i].name + COLON) + _max));
		}

		width = min(width, max_width);
		height = line_height * (items_count + (_description != -1) + info_count); //+1 if desc, + amount of extra info bits
		options_height = (line_height * options_count) + (margin * 2);
		
		full_width = width + (margin * 2);
		full_height = height + (margin * 2);
	}
	return _menu;
}

///@desc Returns array with items broken up to fit max width
function split_string_by_width(_array, _max_width, _scale = 1) {
    _max_width /= _scale;
	var new_array = [];

    for (var i = 0; i < array_length(_array); i++) {
        var line = _array[i];

        while (string_width(line) > _max_width) {
            var words = string_split(line, " "); // Split into words
            var temp_line = "";
            var split_pos = 0;

            // Build a valid line that fits within max_width
            for (var j = 0; j < array_length(words); j++) {
                var test_line = (temp_line == "") ? words[j] : temp_line + " " + words[j];

                if (string_width(test_line) > _max_width) {
                    break; // Stop before exceeding max_width
                }

                temp_line = test_line;
                split_pos = j;
            }

            // Add the valid portion to the new array
            array_push(new_array, temp_line);

            // Reconstruct the remaining part of the string
            line = "";
            for (var j = split_pos + 1; j < array_length(words); j++) {
                line += (j > split_pos + 1 ? " " : "") + words[j];
            }

            // If the remaining line is empty, stop
            if (string_length(line) == 0) {
                break;
            }
        }

        // Add the last remaining part (if any)
        if (string_length(line) > 0) {
            array_push(new_array, line);
        }
    }

    return new_array;
}

function close_menu(_inst) {
	with (_inst) {	
		menu_open = false; //Important for pressing escape key
		obj_camera_zoom.reset_target();
		if (menu != noone) {
			instance_destroy(menu);
			if (instance_exists(obj_report)) instance_destroy(obj_report);
			menu = noone;
		}
	}
}

function close_other_menus(_id) {
	var _ids = array_concat(layer_get_all_elements("Subordinates"), layer_get_all_elements("Items"));
		for (var i = 0; i < array_length(_ids); i++) {
			var _inst = layer_instance_get_instance(_ids[i]);
			if (_inst.menu_open and _inst != _id) close_menu(_inst); //dont want to destroy any menu (other non-sub objects might have menus)
		}
}

function create_report(_x, _y, _name, _text, _previous_menu = noone) {
	var _report = instance_create_depth(_x, _y, -999, obj_report);
	with (_report) {
		name = _name;
		previous_menu = _previous_menu;
		
		draw_set_font(fnt_menu);
		width = max(width, scale * string_width(_name));
		
		var _max = 0;
		text = split_string_by_width(_text, max_width, scale);
		for (var i = 0; i < array_length(text); i++) {
			_max = max(_max, string_width(text[i]));
			line_count++;
		}

		width = max(width, (scale * _max) + indent);
		width = min(width, max_width);
		height = line_height * line_count;
		
		full_width = width + (margin * 2);
		full_height = height + (margin * 2);
	}
}

function create_select_menu(_x, _y, _options, _scale, _pivot = "left", _description = "") {
	var _menu = instance_create_depth(_x, _y, -999, obj_select);
	with (_menu) {
		options = _options;
		scale = _scale;
		margin *= scale;
		line_height *= scale;
		description = _description;
		
		draw_set_font(fnt_menu);
		if (description != "") {
			options_count++;
			width = scale * string_width(_description);
		}
		
		var _max = 0;
		//text = split_string_by_width(_options, max_width, scale);
		for (var i = 0; i < array_length(_options); i++) {
			_max = max(_max, string_width(_options[i].info.text));
			options_count++;
		}

		width = max(width, scale * (_max + string_width(HOVER_MARKER)));
		width = min(width, max_width);
		height = line_height * options_count;
		
		full_width = width + (margin * 2);
		full_height = height + (margin * 2);
		
		if (_pivot = "center") x -= width * 0.5;
	}
	
	return _menu;
}