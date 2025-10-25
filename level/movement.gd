class_name MovementLayer
extends TileMapLayer


var blocked: Dictionary[Vector2i, bool] = {}


func _ready() -> void:
	# not visible ingame
	hide()
	
	# parse tilemap for starting values
	for c in get_used_cells():
		blocked[c] = true


func is_blocked(cell_coord: Vector2i) -> bool:
	if cell_coord in blocked:
		return blocked[cell_coord]
	
	return false


func block_cell(cell_coord: Vector2i) -> void:
	blocked[cell_coord] = true

func unblock_cell(cell_coord: Vector2i) -> void:
	blocked[cell_coord] = false
