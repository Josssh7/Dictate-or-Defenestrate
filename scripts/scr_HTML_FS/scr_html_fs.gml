

// This function was originally written by Mark Alexander
// https://gamemaker.io/en/tutorials/the-basics-of-scaling-html5
// This makes sure the aspect ratio is respected, don't call it if you want it to stretch to fill
function HTML_FS_canvas_aspect_ratio(_base, _bw, _bh)
{
	view_wport[0] = _bw;
	view_hport[0] = _bh;
	window_set_size(_bw, _bh);
	window_center();

	var _aspect = (_bw / _bh);
	if (_aspect < 1)
	{
		var _vw = _base * _aspect;
		var _vh = _base;
	}
	else
	{
		_vw = _base;
		_vh = _base / _aspect;
	}
}


// This calls the JavaScript file (ToggleFullScreen.js)
// It should work on Android although on iOS it seems to only resize the canvas, still good though!
function HTML_FS_canvas_fullscreen()
{
	ToggleFullScreen();
	resizeDelayCUR = resizeDelayMAX;
	HTML_FS_canvas_aspect_ratio(base_size, browser_width, browser_height);
}


function HTML_FS_Create()
{
	base_size = min(browser_width, browser_height);
	HTML_FS_canvas_aspect_ratio(base_size, browser_width, browser_height);

	resizeDelayMAX = 1;
	resizeDelayCUR = resizeDelayMAX;
}


function HTML_FS_Step()
{
	if (resizeDelayCUR > 0)
	{
		resizeDelayCUR -= 1;
	}
	else
	{
		resizeDelayCUR = 0;
		HTML_FS_canvas_aspect_ratio(base_size, browser_width, browser_height);
	}
	
	var _allowed = true;
	for(var i = 0;i<instance_number(obj_textbox_input);i++){
	    var _textbox_id = instance_find(obj_textbox_input,i);

	    if (_textbox_id.typing){
	       _allowed = false
	        break;
	    }
}
	
	if (keyboard_check_pressed(ord("F")) and _allowed) { HTML_FS_canvas_fullscreen(); }
}