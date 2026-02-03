extends Control

@onready var mouse_coords_value_label = $VBoxContainer/HBoxContainer/MouseCoordsValueLabel

func _input(event):
	if event.is_action_pressed("ui_debug_menu"):
		if visible:
			visible = false
		else:
			visible = true

func _process(_delta: float) -> void:
	var mouse_coords = get_global_mouse_position()
	mouse_coords_value_label.text = "(%d, %d)" % [mouse_coords.x, mouse_coords.y]
