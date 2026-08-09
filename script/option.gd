extends Node2D

@onready var button_mute: Button = $Control/Button_Mute
var muted = false
func _on_button_mute_pressed() -> void:
	if muted:
		AudioServer.set_bus_volume_db(0,0)
		button_mute.text = "Mute music"
		muted = false
	else:
		AudioServer.set_bus_volume_db(0,-100)
		button_mute.text = "Unmute music"
		muted = true
