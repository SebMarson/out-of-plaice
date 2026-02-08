extends Control

@onready var money_label = $CenterContainer/VBoxContainer/MoneyLabel
@onready var distance_label = $CenterContainer/VBoxContainer/DistanceLabel
@onready var car_sprite = $CarSprite
@onready var try_again = $Container/TryAgainButton

@onready var water_sprite_1: AnimatedSprite2D = $WaterSprite
@onready var water_sprite_2: AnimatedSprite2D = $WaterSprite2
@onready var water_sprite_3: AnimatedSprite2D = $WaterSprite3
@onready var water_sprite_4: AnimatedSprite2D = $WaterSprite4

func _ready() -> void:
	money_label.text = "£%d" % [GameState.player_money]
	distance_label.text = "That's enough money to travel %d away from this hellish sea!" % [GameState.player_money * 10]
	car_sprite.play()
	water_sprite_1.play()
	water_sprite_2.play()
	water_sprite_3.play()
	water_sprite_4.play()

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
