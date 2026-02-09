
class_name Fish
extends RigidBody2D

# Fish params
@export var species: String # Different species have a different index type
@export var texture_normal: Resource = preload("res://resources/images/fish/fish_plaice_normal.png")
@export var scene: Resource = preload("res://scenes/entities/fish.tscn")
@export var fish_description: String

# Fish health stats
@export var weight_min: int = 350
@export var weight_max: int = 450
@export var weight: int = 0
@export var parasites = Mouth.NO_PARASITE
@export var aura = Aura.FISHY
@export var value = Value.LOW
@export var rarity = Rarity.COMMON
@export var glow: bool = false
@export var tainted: bool = false

# Game state params
@export var state = 0 # 0 = nothing, 1 = destroyed, 2 = sold (see bin.gd)

# Object params
@export var hovering: bool

# Child objects
@onready var fish_sprite: Sprite2D = $FishSprite
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	weight = randi_range(weight_min, weight_max)
	
	# Setup child objects
	fish_sprite.texture = texture_normal
	fish_sprite.scale = Vector2(0.1, 0.1)
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

static func randomize_fish(new_fish) -> void:
	if randf_range(0, 1) > 0.6:
		new_fish.tainted = true
		var feature = randi_range(1, 6)
		match feature:
			1:
				new_fish.weight = randi_range(new_fish.weight_min, new_fish.weight_max) * 100
			2:
				if new_fish.parasites == true:
					new_fish.parasites = false
				else:
					new_fish.parasites = true
			3:
				var new_aura = Aura.get_random()
				while new_aura == new_fish.aura:
					new_aura = Aura.get_random()
				new_fish.aura = new_aura
			4:
				var new_value = Value.get_random()
				while new_value == new_fish.value:
					new_value = Value.get_random()
				new_fish.value = new_value
			5:
				var new_rarity = Rarity.get_random()
				while new_rarity == new_fish.rarity:
					new_rarity = Rarity.get_random()
				new_fish.rarity = new_rarity
			6:
				if new_fish.glow == true:
					new_fish.glow = false
				else:
					new_fish.glow = true
