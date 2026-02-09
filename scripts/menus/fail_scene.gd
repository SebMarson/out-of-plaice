extends Control

@onready var water_1 = $WaterNode/Water1
@onready var water_2 = $WaterNode/Water2
@onready var water_3 = $WaterNode/Water3
@onready var water_4 = $WaterNode/Water4
@onready var water_5 = $WaterNode/Water5
@onready var water_6 = $WaterNode/Water6

@onready var fail_label = $CenterContainer/VBoxContainer/FailTextLabel

func _ready() -> void:
	water_1.play()
	water_2.play()
	water_3.play()
	water_4.play()
	water_5.play()
	water_6.play()
	
	Audio.play_music(Music.end_of_days)
	if GameState.corruption >= 100:
		fail_label.text = TextRepo.gameover_text_corruption
	else:
		fail_label.text = TextRepo.gameover_text_bad_ending

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
