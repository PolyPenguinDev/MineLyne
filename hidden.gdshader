shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
	COLOR.a = COLOR.r;
	COLOR.b = 0.8;
	COLOR.r = 0.1;
	COLOR.g = 0.5;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
