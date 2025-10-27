extends Area2D


@export_file_path("*.tscn") var level: String


func _on_body_entered(body: Node2D) -> void:
	if body is OverworldPlayer:
		get_tree().change_scene_to_file(level)
