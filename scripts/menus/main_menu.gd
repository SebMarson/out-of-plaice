extends Control

# music test
func _ready() -> void:
	Audio.play_music(Music.sleepy_sailor_1)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

#settings scene called from main menu via button
func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/settings_menu.tscn")
