shader_type canvas_item;

void vertex() {
}

void fragment() {
	
  COLOR = vec4(UV * 0.3, sin(mod(TIME,1.0) * TAU) * 0.1 + 0.5, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
