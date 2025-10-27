extends Node


@export var pawns: Array[Pawn]

var active_pawn: int = 9


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
		
		if event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://overworld/blank_sprout_lands_tile_map.tscn")


func _ready() -> void:
	GlobalEventBus.p1_down.connect(on_p1_down)
	GlobalEventBus.p1_up.connect(on_p1_up)
	GlobalEventBus.p1_left.connect(on_p1_left)
	GlobalEventBus.p1_right.connect(on_p1_right)
	
	GlobalEventBus.p2_down.connect(on_p2_down)
	GlobalEventBus.p2_up.connect(on_p2_up)
	GlobalEventBus.p2_left.connect(on_p2_left)
	GlobalEventBus.p2_right.connect(on_p2_right)
	
	GlobalEventBus.p3_down.connect(on_p3_down)
	GlobalEventBus.p3_up.connect(on_p3_up)
	GlobalEventBus.p3_left.connect(on_p3_left)
	GlobalEventBus.p3_right.connect(on_p3_right)


func on_p1_down() -> void:
	pawns[0].move(Vector2i.DOWN)

func on_p1_up() -> void:
	pawns[0].move(Vector2i.UP)

func on_p1_left() -> void:
	pawns[0].move(Vector2i.LEFT)

func on_p1_right() -> void:
	pawns[0].move(Vector2i.RIGHT)

func on_p2_down() -> void:
	pawns[1].move(Vector2i.DOWN)

func on_p2_up() -> void:
	pawns[1].move(Vector2i.UP)

func on_p2_left() -> void:
	pawns[1].move(Vector2i.LEFT)

func on_p2_right() -> void:
	pawns[1].move(Vector2i.RIGHT)

func on_p3_down() -> void:
	pawns[2].move(Vector2i.DOWN)

func on_p3_up() -> void:
	pawns[2].move(Vector2i.UP)

func on_p3_left() -> void:
	pawns[2].move(Vector2i.LEFT)

func on_p3_right() -> void:
	pawns[2].move(Vector2i.RIGHT)
