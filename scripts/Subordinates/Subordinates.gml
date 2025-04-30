global.names = [
	"Micah",
	"Miloh",
	"Enock",
	"Darrah",
	"Finn",
	"Brook",
	"Remy",
	"Leander",
	"Berkeley",
	"Nikola",
	"Alex",
	"Papi",
	"Charlie",
	"Luca",
	"Lars",
	"Ayden",
	"Daniel",
	"Alex",
	"Peter",
	"Casper",
	"Linda",
]

global.hobbies = [
	"Baking",
	"Aquarium Keeping",
	"Bonsai",
	"Basket Weaving",
	"Game Development",
	"Embroidery",
	"Gardening",
	"Basketball",
	"Piano",
	"Singing",
	"Sewing",
	"Painting",
	"Trombone",
	"Scrapbooking",
	"Hacking",
	"Hiking",
	"Running",
	"Picnics",
	"Dogs",
	"Cats",
	"Turtles",
	"Tai Chi",
	"Sand Castle Building",
	"Coin Collecting",
	"Pokemon Cards",
	"Wrestling",
	"Rubix Cubing",
	"Axe Throwing",
	"Social Deduction Games",
	"Parkour",
	"People Watching",
	"Amateur Geology",
	"Metallurgy",
]

global.media = [
	"Heavy Metal",
	"Classical Music",
	"Lofi Hip Hop Beats to Study/Relax to",
	"Cowboy Pop",
	"Splittercore",
	"Japanese Fusion Jazz",
	"Reggae",
	"Freak Folk",
	"Boogie-Woogie",
	"Hip Hop",
	"1984",
	"Brave New World",
	"The Hunger Games",
	"Fahrenheit 451",
	"The Time Machine",
	"Never Let Me Go",
	"A Clockwork Orange",
	"Slaugherhouse-Five",
	"Zelda & Chill",
]

global.ideas = [ //democracy maybe impact gameplay
	"Fascism",
	"The Color Yellow",
	"Democracy",
	"Friendship",
	"Anarchy",
	"Business",
	"The Pigeonhole Principle",
	"Proof by Mathematical Induction",
	"Cosine Rule",
	"Ordering in an Italian Accent at Pizza Restaurants",
	"Christopher Nolan Movies",
	"Deadpan Humour",
	"The Relentless March of Time",
	"The Indomitable Human Spirit",
	"Sunsets in Autumn",
	"Tap Water",
]

function SubSprite(_sprite) constructor
{
	sprite = _sprite;
	used = false;
}

global.sub_sprites = [ //idk how to iterate through groups :(
	new SubSprite(spr_gobsmacked_man),
	new SubSprite(spr_happier_girl),
	new SubSprite(spr_happy_girl),
	new SubSprite(spr_happy_man),
	new SubSprite(spr_hat_man),
	new SubSprite(spr_jacket_man),
	new SubSprite(spr_scary_man),
	new SubSprite(spr_shadow_man),
	new SubSprite(spr_sunglass_girl),
]

///@description Mutator method for sprites (prevents repeats)
function select_sub_sprite() {
	
	var _index = irandom(array_length(global.sub_sprites)-1);
	while (global.sub_sprites[_index].used) {
		_index = irandom(array_length(global.sub_sprites)-1);
	}
	global.sub_sprites[_index].used = true;
	return global.sub_sprites[_index].sprite;
}

///@param {string} _role the subordinates role
function Subordinate(_role) constructor
{
	name = global.names[irandom(array_length(global.names)-1)];
	sprite = select_sub_sprite();
	role = _role;
	activity = get_sub_activity(_role);
	skill = global.start_skill;
	joined = global.calendar[global.day]; //Format when being used
	likes = [
				global.hobbies[irandom(array_length(global.hobbies)-1)],
				global.media[irandom(array_length(global.media)-1)],
				global.ideas[irandom(array_length(global.ideas)-1)],
			];
	popularity = irandom(100);
	trust = 40;
	trust_rate = 3;
	fear = 50;
	fear_rate = -3;
	locked = false;
}

function initialise_subs() {
	return {
		personal_advisor: new Subordinate("Personal Advisor"), //Is this the best way to do this?
		appearance_manager: new Subordinate("Public Appearance Manager"),
		propaganda_minister: new Subordinate("Propaganda Minister"),
		treasurer: new Subordinate("Treasurer"),
		commander: new Subordinate("Commander-in-chief"),
	}
}

///@param {string} _key Key to access subordinate from subs struct
function update_sub(_key) {	
	if (irandom(1) == 1) global.subs[$ _key].skill = min(global.subs[$ _key].skill+1, 50);
	increase_sub_trust(_key, global.subs[$ _key].trust_rate);
	increase_sub_fear(_key, global.subs[$ _key].fear_rate);
}

function get_sub_activity(_role) {
	switch (_role) {
		case "Personal Advisor": 
			return new MenuOption("Consolidate Power", undefined);
		case "Public Appearance Manager": 
			return new MenuOption("Public Speech", undefined);
		case "Propaganda Minister": 
			return new MenuOption("Censor Media", undefined);
		case "Treasurer": 
			return new MenuOption("Manage Investments", undefined);
		case "Commander-in-chief": 
			return new MenuOption("Diplomacy", undefined);
	}
}

function increase_sub_trust(_key, _val) {
	with global.subs[$ _key] {
		if (locked) trust = clamp(trust+_val, trust, 100); //Can't decrease when locked
		else trust = clamp(trust+_val, 0, 100);
		if (trust > 90 and !locked) _locked = true;
	}
}

function increase_sub_fear(_key, _val) { global.subs[$ _key].fear = clamp(global.subs[$ _key].fear+_val, 0, 100) }

function kill_sub(_key) { //Might be easier to destroy instance from respective function
	global.subs[$ _key] = noone;
	global.calendar[global.day+1].subs[$ _key] = false;
}