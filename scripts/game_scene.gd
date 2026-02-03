extends Node2D

# Preloaded scenes
var fish_scene = preload("res://scenes/entities/fish.tscn")
var bin_scene = preload("res://scenes/entities/bin.tscn")

var fish = []
var bins = []

func _init():
	pass

func _ready() -> void:
	# Generate fish for the scene
	var new_fish = fish_scene.instantiate()
	fish.append(new_fish)
	add_child(new_fish)
	
	# Generate bins for the scene
	var new_bin = bin_scene.instantiate()
	new_bin.global_position = Vector2(200, 500)
	new_bin.state = 1
	bins.append(new_bin)
	add_child(new_bin)
	
	var second_bin = bin_scene.instantiate()
	second_bin.global_position = Vector2(1000, 500)
	second_bin.state = 2
	bins.append(second_bin)
	add_child(second_bin)
