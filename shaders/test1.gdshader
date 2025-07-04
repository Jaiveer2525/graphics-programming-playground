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
uniform float shimmer_speed = 20.0;
uniform float shimmer_density = 12.0;
uniform float shimmer_intensity = 0.3;

void fragment() {
	// Called for every pixel the material is visible on.
	float wave = sin(UV.y * shimmer_density + -TIME * shimmer_speed);
	float shade = 1.0 - shimmer_intensity + (wave * shimmer_intensity); // 0.6 to 1.0
	vec3 final_color = water_color.rgb * shade;
	COLOR = vec4(final_color, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
