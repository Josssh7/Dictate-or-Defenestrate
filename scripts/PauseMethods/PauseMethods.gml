function input_ok() {
	if (variable_global_exists("fading")) return !global.fading;
	else return true;
}