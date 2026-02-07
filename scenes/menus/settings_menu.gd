extends Control


# back button to go back to the main menu
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


#function to toggle fullscreen if checkbox check
func _on_toggled(toggled_on: bool) -> void:
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)


##ignore - to fix






#@export var audio_bus_name := "sfx"
#@onready var _bus := AudioServer.get_bus_index(audio_bus_name)

#func _ready() -> void:
#	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

#func _on_value_changed(value: float) -> void:
#	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))





#func _ready() -> void:
#	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

#func _on_value_changed(value: float) -> void:
#	Audio.music_player.volume_db = linear_to_db(value)
	#AudioServer.set_bus_volume_db(_bus, linear_to_db(value))






#@export var audio_bus_name := "music"
#@onready var _bus := AudioServer.get_bus_index(audio_bus_name)
#func _ready() -> void:
#	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

#func _on_value_changed(value: float) -> void:
#	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))
