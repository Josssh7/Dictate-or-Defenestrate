global.names = [
	"Micah",
	"Miloh",
	"Enock",
	"Darrah",
	"Finn",
	"Brook",
	"Remy",
	"Leander",
	"Berkely",
	"Nikola",
	"Alex",
	"Papi",
	"Charlie",
	"Luca",
	"Lars",
	"Ayden",
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