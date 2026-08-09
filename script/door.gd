extends Area2D

var player_near = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	var current_scene = get_tree().current_scene
	if Input.is_action_just_pressed("jump") and player_near:
		print(current_scene.name)
		if current_scene.name == "Level1":
			get_tree().change_scene_to_file("res://scenes/Level/level_2.tscn")
		elif current_scene.name == "Level2":
			get_tree().change_scene_to_file("res://scenes/Level/level_3.tscn")
		elif current_scene.name == "Level3":
			get_tree().change_scene_to_file("res://scenes/Level/level_4.tscn")
		elif current_scene.name == "Level4":
			get_tree().change_scene_to_file("res://scenes/Level/level_5.tscn")
		elif current_scene.name == "Level_5":
			get_tree().change_scene_to_file("res://scenes/Level/main_menu.tscn")
			





func _on_body_entered(body):
	print("enter")
	animated_sprite.play("open")
	player_near = true

func _on_body_exited(body):
	animated_sprite.play("closed")
	player_near = false
