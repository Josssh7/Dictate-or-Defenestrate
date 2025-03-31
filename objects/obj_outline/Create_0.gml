upixel_h = shader_get_uniform(sh_outline, "pixelH");
upixel_w = shader_get_uniform(sh_outline, "pixelW");
uoutline_color = shader_get_uniform(sh_outline, "outline_color");
uoutline_thickness = shader_get_uniform(sh_outline, "outline_thickness");
texel_w = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texel_h = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

//Default values, change for specific objects
thickness = 1;
color = [1.0, 0.7450980392156863, 0.043137254901960784];

overlap = function() { return false }; //For individual objects to see if overlapping layers