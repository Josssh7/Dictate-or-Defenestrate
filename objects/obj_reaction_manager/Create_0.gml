heightened_reaction = 8;

//Initial Values for Room Enter
reaction_sprite = spr_happy;
reaction_rate = heightened_reaction * 0.75;

function set_reaction(_sprite) {
	reaction_sprite = _sprite;
	reaction_rate = heightened_reaction;
}