extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dialog_box: Node2D = $DialogBox


@export_multiline var dialog_text: String

func _ready():
	dialog_box.dialog_text = dialog_text

func _on_body_entered(body):
	print("entered")
	animation_player.play("appear")

func _on_body_exited(body):
	animation_player.play("RESET")
