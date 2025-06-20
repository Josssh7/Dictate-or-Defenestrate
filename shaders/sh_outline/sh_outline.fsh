//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;
uniform vec3 outline_color;
uniform float outline_thickness;
//vec3(1.0, 0.7450980392156863, 0.043137254901960784)

void main()
{
	vec2 offsetx = vec2(pixelW * outline_thickness, 0.0);
	vec2 offsety = vec2(0.0, pixelH * outline_thickness);
	
	//Figure out what this does later
	float Initial_Alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
	gl_FragColor.rgb = mix( gl_FragColor.rgb, outline_color, float(Initial_Alpha==0.0) );
}