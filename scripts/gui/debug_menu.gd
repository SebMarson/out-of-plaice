extends Control

@onready var mouse_coords_value_label = $VBoxContainer/HBoxContainer/MouseCoordsValueLabel
@onready var day_time_value_label = $VBoxContainer/HBoxContainer3/DayTimeValueLabel
@onready var corruption_value_label = $VBoxContainer/HBoxContainer4/CorruptionValueLabel

func _input(event):
	if event.is_action_pressed("ui_debug_menu"):
		if visible:
			visible = false
		else:
			visible = true

func _process(_delta: float) -> void:
	var mouse_coords = get_global_mouse_position()
	mouse_coords_value_label.text = "(%d, %d)" % [mouse_coords.x, mouse_coords.y]
	day_time_value_label.text = "%f s" % [GameState.day_timer.time_left]
	corruption_value_label.text = "%s" % [GameState.corruption]

func _on_spawn_fish_button_pressed() -> void:
	SignalBus.spawn_fish.emit()

func _on_corruption_up_button_pressed() -> void:
	GameState.increase_corruption(10)

func _on_corruption_down_button_pressed() -> void:
	GameState.increase_corruption(-10)
