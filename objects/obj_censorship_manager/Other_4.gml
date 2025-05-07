randomise();
var _article = articles[irandom(array_length(articles)-1)];

//Create Title
instance_create_layer(room_width*0.5, 450, layer, obj_headline, { text : _article.headline }); 

//Create Column 1
draw_set_font(fnt_newspaper);
var _initial_x = 60;
var _x = _initial_x;
var _y = 1065;
var _column = string_split(_article.content[0], " ");

for (var i = 0; i < array_length(_column); i++) {
	var _word = _column[i];
	
	var _value = -1; //Default for normal words
	if (array_contains(bad_words, _word)) _value = 2;
	else if (array_contains(good_words, _word)) _value = -3;
	
	if (_x + string_width(_word) > _initial_x + column_width) {
		_x = _initial_x;
		_y += line_height;
	}
	
	instance_create_layer(_x, _y, "Text", obj_word, { text : _word, value : _value });
	_x += string_width(_word + " ");
}