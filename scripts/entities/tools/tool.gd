class_name Tool
extends Control
	
# Child objects
@onready var tool_texture = $ToolTexture

# Locals
@onready var width = tool_texture.size.x * tool_texture.scale.x
@onready var height = tool_texture.size.y * tool_texture.scale.y
var tool_type: String = ToolTypes.AURA

# Object params
@export var hovering: bool
@export var dragging: bool
@export var original_position: Vector2

func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if hovering and event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		original_position = global_position
		dragging = true
	elif hovering and event is InputEventMouseButton and event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = false
		SignalBus.tool_triggered.emit(self)
		global_position = original_position
	
func _process(_delta) -> void:
	# Checks if the mouse is over the tool, and the left mouse button is pressed (Dragging)
	if dragging:
		global_position = get_global_mouse_position() - Vector2(width/2, height/2)

func _on_mouse_entered() -> void:
	hovering = true

func _on_mouse_exited() -> void:
	hovering = false

func get_tool_result(fish: Fish) -> String:
	return ""
