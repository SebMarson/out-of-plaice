extends Control

func _ready() -> void:
	Audio.play_music(Music.end_of_days)

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
