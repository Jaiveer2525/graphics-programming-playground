shader_type canvas_item;

void vertex() {
	float t = sin(TIME * 3.0);
	vec2 vertex = VERTEX;
	vertex.x += (vertex.y * t) * 0.25;
	vertex.y = -vertex.y;
	VERTEX = vertex;
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 uv = UV;
    float wave = sin(uv.y * 20.0 + TIME * 5.0);
    COLOR = vec4(uv.x + wave * 0.1, uv.y, 0.5, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
