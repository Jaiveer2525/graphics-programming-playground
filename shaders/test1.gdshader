shader_type canvas_item;

void vertex() {
	//float t1 = sin(TIME * 2.0 + UV.y * 4.0);
	//float t2 = cos(TIME * 1.5 + UV.x * 3.0);
	//vec2 vertex = VERTEX;
	//vertex.x += (UV.y) * t1 * 8.0;
	//vertex.y += (UV.y) * t2 * 4.0;
	//VERTEX = vertex;
}

uniform vec4 water_color : source_color = vec4(0.2, 0.6, 1.0, 1.0); // light blue
uniform vec3 white = vec3(1,1,1);
uniform float speed = 15.0;
uniform float density = 30.0;

void fragment() {
	// Called for every pixel the material is visible on.
	float wave =  sin(SCREEN_UV.y * density + -TIME * speed) -1.5 ;
	float shade = 1.0 + (wave); // 0.6 to 1.0
	vec3 final_color = mix((water_color.rgb), white, shade);
	COLOR = vec4(final_color, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
