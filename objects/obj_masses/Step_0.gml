if (down) {
	y += move_speed;
	if (y >= original_y + amplitude) down = false;
}
else {
	y -= move_speed;
	if (y <= original_y - amplitude) down = true;
}