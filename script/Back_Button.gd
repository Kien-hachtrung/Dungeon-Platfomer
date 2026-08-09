extends CanvasLayer

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level/level_selection.tscn")
