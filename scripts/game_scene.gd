extends Node2D

# Preloaded scenes
var fish_scene = preload("res://scenes/entities/fish.tscn")
var bin_scene = preload("res://scenes/entities/bin.tscn")

var fish = []
var bins = []

# Children
@onready var bottom_shape = $AreaBoundaries/BottomShape
@onready var gui = $GUI

func _init():
	SignalBus.day_timer_expired.connect(_on_day_timeout)

func _ready() -> void:
	# Link signals
	SignalBus.spawn_fish.connect(spawn_fish)
	
	# Spawn fish
	var new_fish = FishGenerator.generate_fish(FishGenerator.PLAICE)
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
	
	# Start game
	SignalBus.day_timer_start.emit(25)

func spawn_fish() -> void:
	var new_fish = FishGenerator.generate_fish(FishGenerator.PLAICE)
	fish.append(new_fish)
	add_child(new_fish)
	
func _on_day_timeout():
	get_tree().change_scene_to_file("res://scenes/menus/end_day_scene.tscn")

	
