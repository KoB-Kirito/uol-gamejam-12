extends CanvasLayer


@export_file_path("*.tscn") var next_level: String

func _on_level_1_level_won() -> void:
	get_tree().change_scene_to_file(next_level)
