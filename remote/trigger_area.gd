extends Area2D


signal button_pressed


func _on_body_entered(body: Node2D) -> void:
	if body is PuzzlePlayer:
		button_pressed.emit()
