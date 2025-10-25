extends Node2D


signal level_won


var pawn_count: int = 0
var pawns_at_target: int = 0


func _ready() -> void:
	count_pawns(self)
	print("Pawns in level: ", pawn_count)


func count_pawns(n: Node) -> void:
	for c in n.get_children():
		if c is Pawn:
			pawn_count += 1
			c.reached_target.connect(on_pawn_reached_target)
			c.left_target.connect(on_pawn_left_target)
		count_pawns(c)


func on_pawn_reached_target() -> void:
	pawns_at_target += 1
	print("Pawns at target: ", pawns_at_target)
	if pawns_at_target >= pawn_count:
		print("Level won")
		level_won.emit()

func on_pawn_left_target() -> void:
	pawns_at_target -= 1
	print("Pawns at target: ", pawns_at_target)
