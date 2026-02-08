extends Control

func _ready() -> void:
	GameState.current_day = 0
	Audio.play_music(Music.another_day)
	Audio.play_sfx(SFX.ocean_ambiance)
	Audio.play_sfx(SFX.bouy_bell)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/intro_scene.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

#settings scene called from main menu via button
func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/settings_menu.tscn")
