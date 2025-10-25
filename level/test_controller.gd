extends Node


@export var pawns: Array[Pawn]

var active_pawn: int = 0


func _unhandled_key_input(event: InputEvent) -> void:
	if not pawns or pawns.size() == 0:
		printerr("No pawns set in test controller")
		return
	
	if pawns.size() > active_pawn:
		if event.is_action_pressed("move_up"):
			pawns[active_pawn].move(Vector2i.UP)
			
		if event.is_action_pressed("move_right"):
			pawns[active_pawn].move(Vector2i.RIGHT)
			
		if event.is_action_pressed("move_down"):
			pawns[active_pawn].move(Vector2i.DOWN)
			
		if event.is_action_pressed("move_left"):
			pawns[active_pawn].move(Vector2i.LEFT)
	
	if event is InputEventKey:
		if event.keycode >= 48 and event.keycode <= 57:
			active_pawn = event.keycode - 49
