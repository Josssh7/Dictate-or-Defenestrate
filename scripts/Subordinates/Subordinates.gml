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
	skill = global.start_skill;
	joined = global.calendar[global.day]; //Format when being used
	likes = [
				global.hobbies[irandom(array_length(global.hobbies)-1)],
				global.media[irandom(array_length(global.media)-1)],
				global.ideas[irandom(array_length(global.ideas)-1)],
			];
	popularity = irandom(100);
	trust = 40;
	trust_rate = 2;
	fear = 50;
	fear_rate = -2;
	locked = false;
}

function initialise_subs() {
	return {
		personal_advisor: new Subordinate("Personal Advisor"), //Is this the best way to do this?
		appearance_manager: new Subordinate("Public Appearance Manager"),
		propagana_minister: new Subordinate("Propaganda Minister"),
		treasurer: new Subordinate("Treasurer"),
		commander: new Subordinate("Commander-in-chief"),
	}
}

///@param {struct} _sub Subordinate instantiated from Subordinate() struct
function update_sub(_sub)
{	
	with _sub {
		if (irandom(1) == 1) skill = min(skill+1, 50);
		trust = clamp(trust+trust_rate, 0, 100);
		if (trust > 90 and !locked) locked = true; //Fear is null now but idk how
		fear = clamp(fear+fear_rate, 0, 100);
	}
}