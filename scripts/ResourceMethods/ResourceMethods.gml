function end_day() {
	if (check_gameover()) room_goto(rm_gameover);
	else room_goto(rm_review);
}

function next_day() {
	global.day++;
	
	//Subordinate Methods
	var _keys = variable_struct_get_names(global.subs);
	
	//1+ Person w/ fear <= 15 --> everyone fear (NOT rate) down 1 (Fearmongering: spreads plans)
	for (var i = array_length(_keys)-1; i >= 0; --i) {
		if (check_dead(global.subs[$ _keys[i]])) continue;
		if (global.subs[$ _keys[i]].fear <= 15) {
			for (var j = array_length(_keys)-1; j >= 0; --j) if(!check_dead(global.subs[$ _keys[j]])) increase_sub_fear(_keys[j], -1);
			break;
		}
	}
	
	//2+ People w/ trust <= 30 --> fear rate down 1 and trust rate down 1 (Plot: increasing deceit and ambition)
	var plot_amnt = 0;
	for (var i = array_length(_keys)-1; i >= 0; --i) {
		if (check_dead(global.subs[$ _keys[i]])) continue;
		if (global.subs[$ _keys[i]].trust <= 30) {
			plot_amnt++;
			if (plot_amnt > 1) {
				for (var j = array_length(_keys)-1; j >= 0; --j) {
					if (check_dead(global.subs[$ _keys[j]])) continue;
					global.subs[$ _keys[j]].fear_rate--;
					global.subs[$ _keys[j]].trust_rate--;
				}
				break;
			}
		}
	}
	
	//Iterate through and update subs
	for (var i = array_length(_keys)-1; i >= 0; --i) if (!check_dead(global.subs[$ _keys[i]])) update_sub(_keys[i]);
	
	//Only 1 Per Day
	replenish_sub();
	
	//Stat Methods
	global.gdp = max(global.gdp + global.gdp_rate, 0);
	global.support = clamp(global.support + global.support_rate, 0, 100);
	global.funds = max(global.funds + global.funds_rate, 0);
}

function check_gameover() {
	//Coup
	var _keys = variable_struct_get_names(global.subs);
	var _coup_amnt = 0
	for (var i = array_length(_keys)-1; i >= 0; --i) {
		if (check_dead(global.subs[$ _keys[i]])) continue;
		if (global.subs[$ _keys[i]].fear <= 15) {
			_coup_amnt++;
			if (_coup_amnt > 2) { //3+ People w/ ambition >= 85 --> Coup: Game Over
				global.gameover_message = "Overthrown in a Coup";
				return true;
			}
		}
	}
	
	//Revolution
	if (global.support <= 5) {
		global.gameover_message = "Beheaded in a Revolution";
		return true;
	}
	
	//Bankruptcy
	if (global.gdp <= 0.5 and global.funds <= 5) {
		global.gameover_message = "Economy Collapsed";
		return true;
	}
	return false;
}