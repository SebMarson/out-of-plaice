extends Node2D

# Preloaded scenes
var fish_scene = preload("res://scenes/entities/fish.tscn")

var fish = []

func _init():
	pass

func _ready() -> void:
	var new_fish = FishGenerator.generate_fish(FishGenerator.PLAICE)
	fish.append(new_fish)
	add_child(new_fish)
