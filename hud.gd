extends CanvasLayer

signal start_game

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func show_message(text: String) -> void:
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over!")

	await $MessageTimer.timeout

	$Message.text = "Dodge The Creeps!"
	$Message.show()

	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score) -> void:
	$ScoreLabel.text = str("00:", "%02d" % score)


func _on_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()


func _on_message_timer_timeout() -> void:
	$Message.hide()
