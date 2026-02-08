extends Control

@onready var money_label = $CenterContainer/VBoxContainer/MoneyLabel
@onready var distance_label = $CenterContainer/VBoxContainer/DistanceLabel

func _ready() -> void:
	money_label.text = "£%d" % [GameState.player_money]
	distance_label.text = "That's enough money to travel %d away from this hellish sea!" % [GameState.player_money * 10]

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
