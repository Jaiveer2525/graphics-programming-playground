shader_type spatial;

uniform sampler2D noise_tex;
uniform float wave_strength = 0.01;
uniform float wave_frequency = 50.0;
uniform float time_speed = 1.0;
uniform float t = 0.0;
void vertex() {
	// Called for every vertex the material is visible on.
	float n = texture(noise_tex, UV * 1.4 + vec2(TIME * 0.1, 0.0)).r;
	VERTEX.y += -n*0.08;
}

uniform vec4 water_color : source_color = vec4(0.2, 0.6, 1.0, 1.0); // light blue
uniform vec3 white : source_color = vec3(1,1,1);
uniform vec3 colour2 : source_color = vec3(0.2, 0.667, 0.839);

void fragment() {
	// Called for every pixel the material is visible on.
	float n = texture(noise_tex, UV * 1.4 + vec2(TIME * 0.1, 0.0)).r;
	vec3 final_color = mix((water_color.rgb), white * 0.1, n);
	float m = texture(noise_tex, UV * 1.4 + vec2((TIME + 1.5) * 0.2, 0.0)).r;
	vec3 second_layer = mix(colour2, white * 0.1, m);

	vec2 uv3 = UV * 8.0 + vec2(TIME * 0.9, TIME * 0.1);
	float n3 = texture(noise_tex, uv3).r;
	vec3 layer3 = mix(vec3(0.0), white, n3 * 0.2);

	ALBEDO = (final_color * 0.7 + second_layer * 0.7 + layer3 * 0.3);
	EMISSION = layer3 * 0.1;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
