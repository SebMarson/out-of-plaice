class_name FishGenerator
extends Node

static var fish_scene = preload("res://scenes/entities/fish.tscn")

# Name, normal weight
const PLAICE = ["Plaice", 400, "res://resources/images/fish/fish_plaice_normal.png"]
const CHEESE = ["Cheese", 400, "res://resources/images/fish/fish_cheese_normal.png"]
const FOG_NOSE = ["Fog Nose", 400, "res://resources/images/fish/fish_fog_nose_normal.png"]
const BI_IMP = ["Bi-Imp", 400, "res://resources/images/fish/fish_bi_imp_normal.png"]
const LANK = ["Lank", 400, "res://resources/images/fish/fish_lank_normal.png"]

# example call:
# var fish = FishGenerator.generate_fish(FishGenerator.PLAICE)
static func generate_fish(_spawn_area: Vector2, _center_point: Vector2, _fish_type: Array) -> Fish:
	# Setup properties for the fish
	var species = _fish_type[0]
	var texture = load(_fish_type[2])
	var weight = _fish_type[1] * randf_range(0.5, 1.5)
	
	# Create and return fish
	var fish = preload("res://scenes/entities/fish.tscn").instantiate()
	fish.setup(species, texture, weight, [])
	fish.global_position = get_spawn_point(_spawn_area, _center_point)
	return fish

static func generate_random_fish(_spawn_area: Vector2, _center_point: Vector2) -> Fish:
	var all_fish = [PLAICE, CHEESE, FOG_NOSE, BI_IMP, LANK]
	return generate_fish(_spawn_area, _center_point, all_fish[randi_range(0, 4)])

static func get_spawn_point(_spawn_area: Vector2, _center_point: Vector2) -> Vector2:
	var x_min = _center_point.x - (_spawn_area.x/2)
	var x_max = _center_point.x + (_spawn_area.x/2)
	
	var y = _center_point.y

	return Vector2(randf_range(x_min, x_max), y)
