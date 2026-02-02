class_name FishGenerator
extends Node

static var fish_scene = preload("res://scenes/entities/fish.tscn")

# Name, normal weight
const PLAICE = ["Plaice", 400]

# example call:
# var fish = FishGenerator.generate_fish(FishGenerator.PLAICE)
static func generate_fish(_fish_type: Array) -> Fish:
	# Setup properties for the fish
	var species = _fish_type[0]
	var weight = _fish_type[1] * randf_range(0.5, 1.5)
	
	# Create and return fish
	var fish = fish_scene.instantiate()
	fish.setup(species, weight, [])
	return fish
