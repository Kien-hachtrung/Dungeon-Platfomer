extends CanvasLayer

func _on_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level/main_menu.tscn")
