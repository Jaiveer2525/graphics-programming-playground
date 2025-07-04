shader_type canvas_item;

vec2 complex_mul(vec2 a, vec2 b) {
    return vec2(
        a.x * b.x - a.y * b.y,
        a.x * b.y + a.y * b.x
    );
}

vec2 rotate_point(vec2 point, vec2 center, float angle) {
    vec2 relative = point - center;
    vec2 rotation = vec2(cos(angle), sin(angle)); // e^(iθ)
    vec2 rotated = complex_mul(relative, rotation);
    return rotated + center;
}


void vertex() {
	float r = VERTEX.x;
	float i = VERTEX.y;
	vec2 z = vec2(r, i);
	VERTEX = rotate_point(z, vec2(20, 20), fract(TIME) * 3.14);
}

void fragment() {
	COLOR = vec4(0.2 , 0.6 , 0.8 , 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
