line_height = 28;
column_width = 340;
photo_length = 275;

photo1 = undefined;
photo2 = undefined;

camera = view_camera[0];

//room_height-camera_height at respective pan_rates + 3s at end
//Rounded to nearest frame (calculations in notebook)
//Adjust timer for freeze frames!
timer = 679;
timer_text_buffer = 5;

censorship_score = 0;
mistakes = [];

fade_alpha = 0;
finished = false;

function setup_column(_x, _y, _initial_x, _content) {
	var _column = string_split(_content, " ");
	
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
}

function finish_censorship() {
	instance_destroy(obj_marker);
	calculate_score();
	finished = true;
	alarm[0] = 1;
}

function calculate_score() {
	var _score = 0;
	var _words = layer_get_all_elements("Text");
	for (var i = 0; i < array_length(_words); i++) {
		var _word = layer_instance_get_instance(_words[i]);
		if (array_length(mistakes) < 3) {
			if (_word.value > 0 and !_word.censored) {
				array_push(mistakes, {text: sanitise_mistake(_word.text), reason: "MISSED"}); 
			}
			else if (_word.value < 0 and _word.censored) {
				array_push(mistakes, {text: sanitise_mistake(_word.text), reason: "NEEDLESS CENSORING"}); 
			}
		}
		if (_word.censored) _score += _word.value;
	}
	_score = max(-10, _score);
	censorship_score = ceil(_score * 0.5);
	global.support = min(global.support + censorship_score, 100);
}

function sanitise_mistake(_str) {
	_str = string_replace_all(_str, ".", "");
	_str = string_replace_all(_str, ",", "");
	_str = string_replace_all(_str, "'", "");
	_str = string_replace_all(_str, "-", "");
	_str = string_replace_all(_str, " ", "");
	return "'" + string_lower(_str) + "'";
}

//Article Stuff
#region
articles = [
	{	headline: "Human Rights Violations But No More Inflation",
		content: [
			"The government today announced a series of new economic measures that effectively 'make inflation illegal' as outlined by our great leader. While officials claim the changes have once-and-for-all solved inflation, critics argue the policies are a bandaid solution and hardly activate meaningful change.",
			"Reports have emerged of new aggressive policing tactics, with eyewitnesses describing scenes of violence and intimidation. A viral video showed officers forcefully detaining a group of peaceful protestors, raising concerns and severe backlash on social media over human rights violations. Legal experts and civil rights organizations have condemned the actions, calling for an extensive independent investigation into the police response.",
			"Officials have denied any wrongdoing, stating that 'maintaining order is paramount'. Meanwhile, activists continue to call for transparency, warning that unchecked authority could lead to further instability. Despite public pressure, no formal investigations have been announced, deepening the public's frustration.",
		]
	},
	{	headline: "Efficiency Initiatives and Strongly Advised Reassignment",
		content: [
			"Officials confirmed today that over 4,000 individuals have been forcefully reassigned from their posts across civil, educational, and media sectors. The Cabinet described the move as a 'strategic consolidation of talent,' aimed at eliminating inefficiencies and reinforcing loyalty within essential departments.",		
			"While some have welcomed the program as a necessary measure to protect societal stability, others have raised concerns. Dismissals were reportedly based on internal evaluations, though the criteria remain undisclosed. Testimony from a whistleblower reveals that descriptions were highly biased and arbitrary, often based on political factors, with critics warning that such unchecked actions threaten to erode institutional integrity and civil liberties.",
			"The program is expected to continue over the coming months, with further 'adjustments' planned. Observers warn that the rapid centralization of power may have unforeseen consequences if public trust erodes. Already, signs of growing dissent have emerged, with small-scale protests and online campaigns gaining momentum.",
		]
	},
];

good_words = [
	"great",
	"paramount",
	"loyalty",
	"stability",
]

bad_words = [
	"bandaid",
	"hardly",
	"aggressive",
	"violence",
	"peaceful",
	"violations",
	"intimidation",
	"forcefully",
	"concerns",
	"instability",
	"biased",
	"arbitrary",
	"purge",
	"unforeseen",
	"erodes",
	"condemned",
	"undermines",
	"dangerous",
	"dissent",
	"pressure",
	"frustration",
	"lack",
	"unchecked",
	"erode",
	"suppress",
	"backlash",
]

photos = [
	spr_army_man,
	spr_banner,
	spr_businessman,
	spr_fist,
	spr_flag,
	spr_parliament,
	spr_revolution,
	spr_spy,
	spr_stern_man,
	spr_trophy,
]
#endregion