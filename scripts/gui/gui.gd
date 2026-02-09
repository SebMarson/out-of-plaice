extends Control

# Labels
@onready var day_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/DayValueLabel
@onready var sold_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/SoldValueLabel
@onready var destroyed_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/DestroyedValueLabel

# Containers
@onready var bottom_container = $ElementsContainer/BottomContainer
@onready var center_container = $CenterContainer
@onready var pause_overlay = $PauseOverlay
@onready var tool_window_popup = $CenterContainer/ToolWindowPopup
@onready var tool_window_label = $CenterContainer/ToolWindowPopup/MarginContainer/VBoxContainer/CenterContainer/ToolInfoLabel
@onready var tool_window_hide_button = $CenterContainer/ToolWindowPopup/MarginContainer/VBoxContainer/HideWindowButton
@onready var parasite_texture = $CenterContainer/ToolWindowPopup/MarginContainer2/ParasiteTexture

# Children
var reference_book

# Preloaded scenes
@onready var reference_book_scene = preload("res://scenes/gui/reference_book/reference_book.tscn")

func _ready() -> void: 
	size = get_viewport_rect().size
	
	# Setup reference_book
	reference_book = reference_book_scene.instantiate()
	reference_book.visible = false
	center_container.add_child(reference_book)
	
	# Setup tool window size
	tool_window_popup.custom_minimum_size = get_viewport_rect().size/4
	
	# Setup signal connections
	SignalBus.pause_start.connect(_on_pause_start)
	SignalBus.pause_stop.connect(_on_pause_stop)
	SignalBus.tool_results_window_triggered.connect(_on_tool_window_show)
	
# Not a very efficient way to handle this, lots of unnecessary calls... but quick to write! Fix later for self respect.
func _process(_delta) -> void:
	day_value_label.text = str(GameState.current_day)
	sold_value_label.text = str(GameState.fish_sold_today)
	destroyed_value_label.text = str(GameState.fish_destroyed_today)

func _on_reference_book_button_pressed() -> void:
	reference_book.visible = true

func _on_pause_start() -> void:
	pause_overlay.visible = true

func _on_pause_stop() -> void:
	pause_overlay.visible = false
	
func _on_tool_window_show(_tool_result_text: String) -> void:
	tool_window_popup.visible = true
	if _tool_result_text == "para":
		tool_window_label.visible = false
		parasite_texture.visible = true
		parasite_texture.texture = load("res://resources/images/gui/mouth/gui_mouth_parasite.png")
	elif _tool_result_text == "nopara":
		tool_window_label.visible = false
		parasite_texture.visible = true
		parasite_texture.texture = load("res://resources/images/gui/mouth/gui_mouth_empty.png")
	else:
		tool_window_label.visible = true
		tool_window_label.text = _tool_result_text
		parasite_texture.visible = false

func _on_hide_window_button_pressed() -> void:
	tool_window_popup.visible = false
