function next_day() {
	var _keys = variable_struct_get_names(global.subs);
	
	//1+ Person w/ fear <= 15 --> everyone fear (NOT rate) down 1 (Fearmongering: spreads plans)
	for (var i = array_length(_keys)-1; i >= 0; --i) {
		if (global.subs[$ _keys[i]].fear <= 15) {
			for (var j = array_length(_keys)-1; j >= 0; --j) increase_sub_fear(_keys[j], -1);
		}
		break;
	}
	
	//2+ People w/ trust <= 30 --> fear rate down 1 and trust rate down 1 (Plot: increasing deceit and ambition)
	var plot_amnt = 0;
	for (var i = array_length(_keys)-1; i >= 0; --i) {
		if (global.subs[$ _keys[i]].trust <= 30) {
			plot_amnt++;
			if (plot_amnt > 1) {
				for (var j = array_length(_keys)-1; j >= 0; --j) {
					global.subs[$ _keys[j]].fear_rate--;
					global.subs[$ _keys[j]].trust_rate--;
				}
				break;
			}
		}
	}
	
	//Iterate through and update subs
	for (var i = array_length(_keys)-1; i >= 0; --i) update_sub(_keys[i]);
}

//3+ People w/ fear <= 10 --> Coup: Game Over