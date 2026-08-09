extends Node2D

@export_multiline var dialog_text: String:
	set(value):
		dialog_text = value
		if label:
			label.text = value

@onready var label: Label = $VBoxContainer/Label

func _ready():
	label.text = dialog_text
