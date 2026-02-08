extends Control

@onready var money_label = $CenterContainer/VBoxContainer/MoneyLabel

func _ready() -> void:
	money_label.text = "£%d" % [GameState.player_money]
