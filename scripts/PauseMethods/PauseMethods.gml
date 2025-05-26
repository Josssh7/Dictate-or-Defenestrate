function input_ok() {
	if (variable_global_exists("fading") and global.fading) return false;
	else if (variable_global_exists("transitioning") and global.transitioning) return false;
	else return true;
}