
class_name Fish
extends RigidBody2D

# Fish params
@export var species: String # Different species have a different index type
@export var texture: Resource
@export var weight: int
@export var oddities: Array = []

# Game state params
@export var state = 0 # 0 = nothing, 1 = destroyed, 2 = sold (see bin.gd)

# Object params
@export var hovering: bool

# Child objects
@onready var fish_sprite: Sprite2D = $FishSprite
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func setup(_species: String, _texture: Resource, _weight: int, _oddities: Array) -> void:
	species = _species
	texture = _texture
	weight = _weight
	oddities.append_array(_oddities)

func _ready() -> void:
	# Set global position
	# todo - this shouldn't spawn in the center during actual gameplay, this is just a placeholder
	self.global_position = (get_viewport_rect().size / 2)
	self.sleeping = true
	
	# Setup child objects
	fish_sprite.texture = texture
	collision_shape.z_index = 1
	
func _process(_delta) -> void:
	pass

# Built in godot method, happens every tick
func _physics_process(_delta: float) -> void:
	# Checks if the mouse is over the fish, and the left mouse button is pressed (Dragging)
	if hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		linear_velocity = (get_global_mouse_position() - global_position) * 50

func _on_mouse_entered() -> void:
	hovering = true

func _on_mouse_exited() -> void:
	hovering = false

func change_state(new_state: int):
	state = new_state
	if state == 1:
		SignalBus.destroy_fish.emit(self)
	elif state == 2:
		SignalBus.sell_fish.emit(self)
	self.queue_free()
