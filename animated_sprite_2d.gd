extends AnimatedSprite2D


func _on_frame_changed():
	print('fc')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("animated sprite ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
