extends Node2D


func _on_arrow_up_button_pressed() -> void:
	GlobalEventBus.p1_up.emit()


func _on_arrow_left_button_pressed() -> void:
	GlobalEventBus.p1_left.emit()


func _on_arrow_right_button_pressed() -> void:
	GlobalEventBus.p1_right.emit()


func _on_arrow_down_button_pressed() -> void:
	GlobalEventBus.p1_down.emit()


func _on_d_left_button_pressed() -> void:
	GlobalEventBus.p2_left.emit()

func _on_d_right_button_pressed() -> void:
	GlobalEventBus.p2_right.emit()


func _on_d_down_button_pressed() -> void:
	GlobalEventBus.p2_down.emit()


func _on_d_up_button_pressed() -> void:
	GlobalEventBus.p2_up.emit()


func _on_e_left_button_pressed() -> void:
	GlobalEventBus.p3_left.emit()


func _on_e_right_button_pressed() -> void:
	GlobalEventBus.p3_right.emit()


func _on_e_up_button_pressed() -> void:
	GlobalEventBus.p3_up.emit()


func _on_e_down_button_pressed() -> void:
	GlobalEventBus.p3_down.emit()
