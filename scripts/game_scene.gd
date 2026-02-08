extends Node2D

# Preloaded scenes
var fish_scene = preload("res://scenes/entities/fish.tscn")
var bin_scene = preload("res://scenes/entities/bin.tscn")

var fish = []
var bins = []

# Children
@onready var gui = $GUI
@onready var spawn_shape = $SpawnArea/SpawnShape

@onready var water_sprite_1: AnimatedSprite2D = $WaterSprite
@onready var water_sprite_2: AnimatedSprite2D = $WaterSprite2
@onready var background_sprite = $BackgroundSprite
@onready var table_sprite = $TableSprite

@onready var top_shape = $AreaBoundaries/TopShape
@onready var bottom_shape = $AreaBoundaries/BottomShape
@onready var left_shape = $AreaBoundaries/LeftShape
@onready var right_shape = $AreaBoundaries/RightShape

func _init():
	SignalBus.day_timer_expired.connect(_on_day_timeout)
	SignalBus.sell_fish.connect(remove_fish)
	SignalBus.destroy_fish.connect(remove_fish)

func _ready() -> void:
	# Start the music
	Audio.play_music(Music.sleepy_sailor_1)
	Audio.play_sfx(SFX.ocean_ambiance)
	
	# Link signals
	SignalBus.spawn_fish.connect(spawn_fish)
	SignalBus.corruption_peaked.connect(_on_corruption_peaked)
	SignalBus.tool_triggered.connect(_on_tool_triggered)
	
	# Generate bins for the scene
	var new_bin = bin_scene.instantiate()
	new_bin.global_position = Vector2(get_viewport_rect().size.x/9, 350)
	new_bin.state = 1
	bins.append(new_bin)
	add_child(new_bin)
	
	var second_bin = bin_scene.instantiate()
	second_bin.global_position = Vector2((get_viewport_rect().size.x/10)*8.5, 375)
	second_bin.state = 2
	bins.append(second_bin)
	add_child(second_bin)
	
	# Adjust positions and scales
	right_shape.global_position = Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y/2)
	bottom_shape.global_position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y)
	
	#water_sprite_1.scale = Vector2(1.2*get_viewport_rect().size.x/1000, 1.2*get_viewport_rect().size.y/1000)
	water_sprite_1.play()
	#water_sprite_2.scale = Vector2(1.2*get_viewport_rect().size.x/1000, 1.2*get_viewport_rect().size.y/1000)
	#water_sprite_2.global_position = Vector2()
	water_sprite_2.play()
	
	# Start game
	SignalBus.day_timer_start.emit(25)
	
func _process(_delta) -> void:
	# todo - bad way to do this, should just have trigger on each fish destroy that if the array is zero we regen then
	if fish.size() == 0:
		for i in GameState.batch_size:
			var new_fish = FishGenerator.generate_random_fish(spawn_shape.shape.size, get_viewport_rect().size/2)
			fish.append(new_fish)
			add_child(new_fish)

func spawn_fish() -> void:
	var new_fish = FishGenerator.generate_random_fish(spawn_shape.shape.size, get_viewport_rect().size/2)
	fish.append(new_fish)
	add_child(new_fish)

func remove_fish(_fish) -> void:
	fish.remove_at(fish.find(_fish))
	
func _on_day_timeout():
	if GameState.days_in_run == GameState.current_day:
		get_tree().change_scene_to_file("res://scenes/menus/final_day_scene.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/menus/end_day_scene.tscn")

func _on_corruption_peaked() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/fail_scene.tscn")

func _on_tool_triggered(tool) -> void:
	# Check if the tool was released while hovering any fish
	var space = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	query.collide_with_areas = true
	
	var result = space.intersect_point(query)
	for i in result:
		var body = i.collider
		if body is RigidBody2D and body is Fish:
			SignalBus.tool_results_window_triggered.emit(tool.get_tool_result(body))
