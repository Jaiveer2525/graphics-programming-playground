shader_type spatial;

uniform float wave_strength = 0.01;
uniform float wave_frequency = 50.0;
uniform float time_speed = 1.0;
uniform float t = 0.0;
void vertex() {
	// Called for every vertex the material is visible on.
    // Create a checker pattern of waves
    //float wave = sin(VERTEX.x * wave_frequency + t);
    // Apply wave to vertical displacement (Y axis)
    //VERTEX.y += wave * wave_strength;
	
}

uniform vec4 water_color : source_color = vec4(0.2, 0.6, 1.0, 1.0); // light blue
uniform vec3 white : source_color = vec3(1,1,1);
uniform sampler2D noise_tex;
void fragment() {
	// Called for every pixel the material is visible on.
	float n = texture(noise_tex, UV * 1.4 + vec2(TIME * 0.1, 0.0)).r;
	vec3 final_color = mix((water_color.rgb), white, n);
	ALBEDO = final_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
