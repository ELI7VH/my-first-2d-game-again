extends Area2D

@export var speed = 400
var screen_size

signal hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

	screen_size = get_viewport_rect().size
	
func _on_body_entered(body):
	print("hit")
	hit.emit(body)
	hide()
	$Deaths.play()
	$CollisionShape2D.set_deferred("disabled", true)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("d"):
		velocity.x += 1
	if Input.is_action_pressed("a"):
		velocity.x -= 1
	if Input.is_action_pressed("s"):
		velocity.y += 1
	if Input.is_action_pressed("w"):
		velocity.y -= 1
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = 'walk'

	
	if velocity.length() > 0:
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		
		velocity = velocity.normalized() * speed

		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_animated_sprite_2d_frame_changed() -> void:
	$Footsteps.set_pitch_scale(randf() * 0.2 + 0.9)
	$Footsteps.play()
	pass # Replace with function body.
