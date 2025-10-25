class_name Pawn
extends Node2D


signal reached_target
signal left_target


@export var movement_grid: MovementLayer
@export var target: Node2D

var current_cell: Vector2i

var cell_size: int = 16
var offset: Vector2i = Vector2(8, 8)

var at_target: bool = false


func _ready() -> void:
	if not movement_grid:
		push_error("No movement grid set")
	
	if not target:
		printerr("No target set!")
	
	cell_size = movement_grid.tile_set.tile_size.x
	offset = Vector2(cell_size / 2, cell_size / 2)
	current_cell = movement_grid.local_to_map(position)
	
	# align to grid
	position = current_cell * Vector2i(cell_size, cell_size) + offset
	#printt(position, current_cell)
	
	# check cell
	if movement_grid.is_blocked(current_cell):
		printerr("Sarting cell is blocked")
		queue_free()
		return
	
	# block cell
	movement_grid.block_cell(current_cell)
	
	# check target
	await get_tree().process_frame #wait connections
	if target.position == position:
		at_target = true
		reached_target.emit()


func move(direction: Vector2i) -> void:
	var target_cell = current_cell + direction
	#print("target: ", target_cell)
	
	# check if target cell is blocked
	if movement_grid.is_blocked(target_cell):
		print("Cell ", target_cell, " is blocked")
		return
	
	# set cell data
	movement_grid.block_cell(target_cell)
	movement_grid.unblock_cell(current_cell)
	
	# move
	position = target_cell * Vector2i(cell_size, cell_size) + offset
	current_cell = target_cell
	
	# check target
	check_target_reached()


func check_target_reached() -> void:
	if target.position == position:
		at_target = true
		%snd_win.play()
		reached_target.emit()
		
	elif at_target:
		at_target = false
		%snd_lose.play()
		left_target.emit()
