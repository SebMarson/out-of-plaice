extends Control

# Labels
@onready var sold_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/SoldValueLabel
@onready var destroyed_value_label = $ElementsContainer/TopContainer/TopRightContainer/HBoxContainer/DestroyedValueLabel

# Containers
@onready var bottom_container = $ElementsContainer/BottomContainer

func _ready() -> void: 
	size = get_viewport_rect().size

# Not a very efficient way to handle this, lots of unnecessary calls... but quick to write! Fix later for self respect.
func _process(_delta) -> void:
	sold_value_label.text = str(GameState.fish_sold_today)
	destroyed_value_label.text = str(GameState.fish_destroyed_today)
