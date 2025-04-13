upixel_h = shader_get_uniform(sh_outline, "pixelH");
upixel_w = shader_get_uniform(sh_outline, "pixelW");
uoutline_color = shader_get_uniform(sh_outline, "outline_color");
uoutline_thickness = shader_get_uniform(sh_outline, "outline_thickness");
texel_w = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texel_h = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

//Default values, change for specific objects
thickness = 1;
outline_color = [1.0, 0.7450980392156863, 0.043137254901960784];
select_color = [1.0, 0.4, 0.8];

overlap = function() { return false }; //For individual objects to see if overlapping layers
selected = false;

function setup_shader(_color) {
	shader_set(sh_outline);
	shader_set_uniform_f(upixel_w, texel_w);
	shader_set_uniform_f(upixel_h, texel_h);
	shader_set_uniform_f(uoutline_thickness, thickness);
	shader_set_uniform_f_array(uoutline_color, _color);
	
	draw_self();
	shader_reset();
}