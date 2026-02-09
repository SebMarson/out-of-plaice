extends Control

@onready var water_1 = $WaterNode/Water1
@onready var water_2 = $WaterNode/Water2
@onready var water_3 = $WaterNode/Water3
@onready var water_4 = $WaterNode/Water4
@onready var water_5 = $WaterNode/Water5
@onready var water_6 = $WaterNode/Water6

@onready var intro_label = $CenterContainer/IntroTextLabel
@onready var explanation_label = $CenterContainer/ExplanationTextLabel
@onready var skip_label = $MarginContainer/SkipLabel

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	water_1.play()
	water_2.play()
	water_3.play()
	water_4.play()
	water_5.play()
	water_6.play()
	
	intro_label.text = TextRepo.intro_text_to_game
	explanation_label.text = TextRepo.explanation_text_to_game
	animation_player.play("intro")
	

func _input(event: InputEvent) -> void:
	if (event is InputEventKey or event is InputEventMouseButton) and event.pressed and skip_label.visible != true:
		skip_label.visible = true
	elif (event is InputEventKey or event is InputEventMouseButton) and event.pressed:
		skip()
		
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	skip_label.visible = true

func skip() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
