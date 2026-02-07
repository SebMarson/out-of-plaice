extends Control

# Labels
@onready var sold_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/SoldValueLabel
@onready var destroyed_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/DestroyedValueLabel

# Containers
@onready var bottom_container = $ElementsContainer/BottomContainer
@onready var center_container = $CenterContainer
@onready var pause_overlay = $PauseOverlay

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
	
	# Setup signal connections
	SignalBus.pause_start.connect(_on_pause_start)
	SignalBus.pause_stop.connect(_on_pause_stop)
	
# Not a very efficient way to handle this, lots of unnecessary calls... but quick to write! Fix later for self respect.
func _process(_delta) -> void:
	sold_value_label.text = str(GameState.fish_sold_today)
	destroyed_value_label.text = str(GameState.fish_destroyed_today)

func _on_reference_book_button_pressed() -> void:
	reference_book.visible = true

func _on_pause_start() -> void:
	pause_overlay.visible = true

func _on_pause_stop() -> void:
	pause_overlay.visible = false
