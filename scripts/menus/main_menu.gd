extends Control

func _ready() -> void:
	GameState.current_day = 0

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
