extends Control

@onready var fish_sold_value_label = $MarginContainer/VBoxContainer/HBoxContainer/FishSoldValueLabel
@onready var fish_destroyed_value_label = $MarginContainer/VBoxContainer/HBoxContainer3/FishDestroyedValueLabel
@onready var player_money_value_label = $MarginContainer/VBoxContainer/HBoxContainer2/PlayerMoneyValueLabel

func _ready() -> void:
	fish_sold_value_label.text = "%d" % [GameState.fish_sold_today]
	fish_destroyed_value_label.text = "%d" % [GameState.fish_destroyed_today]
	player_money_value_label.text = "%d" % [GameState.player_money]

func _on_next_day_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
