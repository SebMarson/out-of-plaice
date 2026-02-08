extends Control

@onready var settings_button = $CenterContainer/Panel/MarginContainer/VBoxContainer/SettingsButton
@onready var main_menu_button = $CenterContainer/Panel/MarginContainer/VBoxContainer/MainMenuButton
@onready var quit_button = $CenterContainer/Panel/MarginContainer/VBoxContainer/QuitButton

func _ready() -> void:
	pass
	
func _input(event):
	if event.is_action_pressed("ui_escape_menu"):
		if visible:
			visible = false
			SignalBus.pause_stop.emit()
			get_tree().set_pause(false)
		else:
			visible = true
			SignalBus.pause_start.emit()
			get_tree().set_pause(true)
	if event.is_action_pressed("pause"):
		if get_tree().paused == true:
			SignalBus.pause_stop.emit()
			get_tree().set_pause(false)
		else:
			SignalBus.pause_start.emit()
			get_tree().set_pause(true)

func _on_main_menu_button_pressed() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit(0)
