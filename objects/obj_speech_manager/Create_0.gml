menu = noone;
topic = "";
topic_score = 3;
score_text = {};
fade_alpha = 0;

display_text = "";
full_text = "";
prompt_text = "";
line_height = 20;
text_index = 1; //Why does the function start at 1??? Very silly of gamemaker
menu_index = 1;
speak_count = -1;
speak_rate = 3; //Frames

function attack(_h, _v, _mult) constructor {
	h = _h; // Left/Right, 0 or 1 * by room_width
	v = _v; // Start Position, 0 - 2 * by (room_height / 2)
	mult = _mult; // Speed Multiplier
}

//Projectile Variables
attacks = [];
attack_speed = 7.5;
insults = [
	"pig",
	"fascist",
	"tyrant",
	"liar",
	"devil",
	"coward",
];

//Methods
#region
function set_text(_text) {
	full_text = _text;
	text_index = 1;
	speak_count = speak_rate;
}

function reset_text() {
	speak_count = -1;
	display_text = "";
}

function set_attacks(_amount, _time_limit) {
	attacks = [];
	for (var i = 0; i < _amount; i++) {
		array_push(attacks, {
			attack : new attack(irandom(1), irandom(2), irandom_range(10, 15) * 0.1),
			signal : ceil((i + 1) * _time_limit / (_amount + 1))
		});
	}
}

function create_projectile(_attack) {
	var _angle = 0;
	if (_attack.h == 0) {	
		if (_attack.v == 0) _angle = -15; //Top Left
	} else {
		if (_attack.v == 0) _angle = 195; //Top Right
		else _angle = 180; //Other Right
	}
	
	var _half_height = room_height * 0.85 * 0.5; //Since don't want projectile off screen
	
	switch(irandom(2)) {
		case 0: //Insult
			instance_create_layer(_attack.h*room_width, _attack.v*_half_height, layer, obj_insult, {
				sprite_index : spr_particle,
				text : string_upper(insults[irandom(array_length(insults) - 1)]),
				proj_speed : attack_speed * _attack.mult,
				angle : _angle,
				explosion_sound : snd_insult_hit,
			});
			break;
		
		case 1: //Bottle
			instance_create_layer(_attack.h*room_width, _attack.v*_half_height, layer, obj_projectile, {
				sprite_index : spr_bottle,
				image_xscale : 2,
				image_yscale : 2,
				proj_speed : attack_speed * _attack.mult,
				angle : _angle,
				color : #1E2D1B,
				explosion_sound : snd_bottle_hit,
			});
			break;
		
		case 2: //Tomato
			instance_create_layer(_attack.h*room_width, _attack.v*_half_height, layer, obj_projectile, {
				sprite_index : spr_tomato,
				image_xscale : 2,
				image_yscale : 2,
				proj_speed : attack_speed * _attack.mult * 1.25, //A little bit faster
				angle : _angle,
				color : #892205,
				explosion_sound : snd_tomato_hit,
			});
			break;
	}
}

function select_topic(_info) {
	var _topic = _info.text;
	switch (_topic) { //Converting to struct keys
		case "Improving Public Relations":
			topic = "public_relations";
			break;
			
		case "Inspiring Enlistment":
			topic = "enlistment";
			break;
			
		case "Securing Funds":
			topic = "funds";
			break;
	}
	
	instance_destroy(menu);
	menu = noone;
	
	var _text = dialogue[$ topic][0].line;
	set_text(_text);
	set_attacks(1, string_length(_text));
}

function select_option(_info) {
	//Update Score
	topic_score += _info.value;
	
	//Set Reactions
	if (_info.value <= 0) obj_reaction_manager.set_reaction(spr_anger);
	else if (_info.value >= 2) obj_reaction_manager.set_reaction(spr_happy);
	
	//Close Menu
	instance_destroy(menu);
	menu = noone;
	
	//Set New Line
	var _line = dialogue[$ topic][_info.index].line;
	set_text(_line + _info.text);
	set_attacks(menu_index, string_length(_line));
}

function apply_score() {
	var _score = 0; //Can't define within each case :(
	switch(topic) {
		case "public_relations": 
			_score = ceil(topic_score*0.5);
			global.support = min(global.support + _score, 100);
			global.support_rate += sign(topic_score);
			score_text = {
				summary: "Public Support: " + string(global.support) + "%", 
				improvement: _score,
				units: "%"
			};
			break;
		
		case "enlistment":
			global.military = min(global.military+topic_score, 100);
			score_text = {
				summary: "Military Strength: " + string(global.military) + "K", 
				improvement: topic_score * 1000,
				units: "K"
			};
			break;
			
		case "funds":
			_score = max(ceil(topic_score * 0.5), 0);
			global.funds = min(global.funds + _score, 100);
			global.funds_rate += sign(topic_score) + 1;
			score_text = {
				summary: "State Funds: $" + string(global.funds) + "K", 
				improvement: _score,
				units: "K"
			};
			break;
	}
}
#endregion

dialogue = {
	public_relations : [
			{	line: "Nation building is a conversation, but now it is streamlined into a monologue for efficiency." },
			{	line: "Our decisions reflect the will of the people, specifically, those who said ",
				options: [ //Shuffled during runtime
					{ text: "'I don't need my rights anyway'.", value: -2 },
					{ text: "'please make decisions on my behalf'.", value: 0 },
					{ text: "'we want greater security'.", value: 2 }
			]},
			{	line: "Which is why we've decided to ",
				options: [ 
					{ text: "give you even less rights!", value: -2 },
					{ text: "diverge from centuries of tradition.", value: 0 },
					{ text: "take greater measures against the " + global.scapegoat + ".", value: 3 }
			]}
	],
	enlistment : [
		{	line: "Voluntary enlistment is mandatory, thank you for your enthusiasm." },
		{	line: "Join the military and become a proud defender of ",
			options: [
				{ text: "autocracy.", value: -2 },
				{ text: "justice.", value: 1 },
				{ text: "the Motherland.", value: 2 }
		]}, 
		{	line: "Every patriot joins. Every traitor meets ",
			options: [
				{ text: "a stern talking to.", value: -2 },
				{ text: "certain death.", value: 1 },
				{ text: "swift and decisive defenestration.", value: 3 }
		]}
	],
	funds : [
		{	line: "We're not raising taxes, we're deepening your investment in the nation." },
		{	line: "Think of your new tax rate as a patriotic donation to ",
			options: [
				{ text: "us, obviously.", value: -2 },
				{ text: "the cause!", value: -1 },
				{ text: "dealing with those darn " + global.scapegoat + ".", value: 2 }
		]},
		{	line: "And remember, you're not losing money, you're gaining ",
			options: [
				{ text: "a little more space in your wallet!", value: -2 },
				{ text: "freedom from choice!", value: 1 },
				{ text: "your part in the glorious vision for the Motherland!", value: 2 },
		]},
	],
}