extends Control

@onready var water_1 = $WaterNode/Water1
@onready var water_2 = $WaterNode/Water2
@onready var water_3 = $WaterNode/Water3
@onready var water_4 = $WaterNode/Water4
@onready var water_5 = $WaterNode/Water5
@onready var water_6 = $WaterNode/Water6

@onready var end_day_label = $MarginContainer/TitleLabel
@onready var fish_sold_value_label = $MarginContainer/VBoxContainer/HBoxContainer/FishSoldValueLabel
@onready var fish_destroyed_value_label = $MarginContainer/VBoxContainer/HBoxContainer3/FishDestroyedValueLabel
@onready var player_money_value_label = $MarginContainer/VBoxContainer/HBoxContainer2/PlayerMoneyValueLabel

func _ready() -> void:
	water_1.play()
	water_2.play()
	water_3.play()
	water_4.play()
	water_5.play()
	water_6.play()
	
	Audio.play_music(Music.another_day)
	fish_sold_value_label.text = "%d" % [GameState.fish_sold_today]
	fish_destroyed_value_label.text = "%d" % [GameState.fish_destroyed_today]
	player_money_value_label.text = "%d" % [GameState.player_money]
	end_day_label.text = "End of Day %d" % GameState.current_day

func _on_next_day_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
