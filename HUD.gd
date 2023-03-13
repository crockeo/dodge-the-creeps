extends CanvasLayer


signal start_game


func show_message(message: String) -> void:
	$Message.text = message
	$Message.show()
	$MessageTimer.start()


func show_game_over() -> void:
	self.show_message("Game Over")
	await $MessageTimer.timeout
	
	# TODO: this has codesmell but I can't figure out why :)
	$Message.text = "Dodge the Creeps"
	$Message.show()
	$StartButton.show()


func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_message_timer_timeout():
	$Message.hide()
