class_name FishGenerator
extends Node

static var fish_scene = preload("res://scenes/entities/fish.tscn")

# example call:
# var fish = FishGenerator.generate_fish(FishGenerator.PLAICE)
static func generate_fish(_spawn_area: Vector2, _center_point: Vector2, _fish) -> Fish:
	# Create and return fish
	var fish = _fish.spawn()
	fish.global_position = get_spawn_point(_spawn_area, _center_point)
	return fish

static func generate_random_fish(_spawn_area: Vector2, _center_point: Vector2) -> Fish:
	var all_fish = [Plaice, Cheese, FogNose, BiImp, Lank]
	return generate_fish(_spawn_area, _center_point, all_fish[randi_range(0, all_fish.size()-1)].new())

static func get_spawn_point(_spawn_area: Vector2, _center_point: Vector2) -> Vector2:
	var x_min = _center_point.x - (_spawn_area.x/2)
	var x_max = _center_point.x + (_spawn_area.x/2)
	
	var y = _center_point.y

	return Vector2(randf_range(x_min, x_max), y)
