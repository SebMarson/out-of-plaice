extends Control

@onready var money_label = $CenterContainer/VBoxContainer/MoneyLabel

func _ready() -> void:
	money_label.text = "£%d" % [GameState.player_money]

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
