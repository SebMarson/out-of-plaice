extends Control

# give sliders names so we can set their values
@onready var master_v_slider = get_node("CenterContainer/UISettingCheckbox/master_volume")
@onready var music_v_slider = get_node("CenterContainer/UISettingCheckbox/music_volume")
@onready var sfx_v_slider = get_node("CenterContainer/UISettingCheckbox/sfx_volume")
@export var audio_bus_name := "Master"
@onready var _bus := AudioServer.get_bus_index(audio_bus_name)

#set sfx sound so can hear - only plays ones
func _ready() -> void:
	Audio.play_sfx(Sounds.goodfish_delicious)
	music_v_slider.value = db_to_linear(Audio.music_player.volume_db) 
	sfx_v_slider.value = db_to_linear(Audio.sfx_player.volume_db) 
	master_v_slider.value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

# back button to go back to the main menu
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

# function to toggle fullscreen if checkbox check
func _on_toggled(toggled_on: bool) -> void:
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

# sfx slider change function
func _on_value_changed_sfx(value: float) -> void:
	Audio.sfx_player.volume_db = linear_to_db(value)

# music slider change function
func _on_value_changed_music(value: float) -> void:
	Audio.music_player.volume_db = linear_to_db(value)

# master slider change function
func _on_value_changed_master(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))
