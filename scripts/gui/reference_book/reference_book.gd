extends Node2D

# Internal variables
var current_page: int = 0
var available_pages = []

@onready var page_sprite = $PageSprite
@onready var title_text = $TitleText

# Full page children
@onready var full_page_chlidren = $FullPageChildren
@onready var page_text = $FullPageChildren/PageText

# Fish page children
@onready var fish_page_children = $FishPageChildren
@onready var fish_sprite = $FishPageChildren/FishSprite
@onready var fish_desc_label = $FishPageChildren/FishDescLabel
@onready var healthy_title_label = $FishPageChildren/HealthyTitleLabel
@onready var weight_label = $FishPageChildren/GridContainer/WeightLabel
@onready var parasites_label = $FishPageChildren/GridContainer/ParasitesLabel
@onready var aura_label = $FishPageChildren/GridContainer/AuraLabel
@onready var value_label = $FishPageChildren/GridContainer/ValueLabel
@onready var rarity_label = $FishPageChildren/GridContainer/RarityLabel
@onready var glow_label = $FishPageChildren/GlowLabel

# Tool page children
@onready var tool_page_children = $ToolPageChildren
@onready var tool_sprite = $ToolPageChildren/ToolSprite
@onready var tool_desc_label = $ToolPageChildren/ToolDescLabel

# Object params
@export var hovering: bool
@export var dragging: bool
@onready var width
@onready var height

# Text templates
var weight_template = "Weight: %s"
var parasites_template = "Parasites: %s"
var aura_template = "Aura: %s"
var value_template = "Value: %s"
var rarity_template = "Rarity: %s"

func _ready() -> void:
	# Global settings
	global_position = (get_viewport_rect().size / 2)
	# var scaled_size = (get_viewport_rect().size / 10)
	
	width = page_sprite.get_rect().size.x
	height = page_sprite.get_rect().size.y
	
	# Child setup
	SignalBus.set_available_pages.connect(_on_reference_page_load)
	page_text.add_theme_color_override("font_color", Color.BLACK)

func _input(event: InputEvent) -> void:
	if hovering and event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = true
	elif hovering and event is InputEventMouseButton and event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = false
	
func _process(_delta) -> void:
	# Checks if the mouse is over the tool, and the left mouse button is pressed (Dragging)
	if dragging:
		global_position = get_global_mouse_position()# - Vector2(width, height)

func _on_reference_page_load(_available_pages) -> void:
	available_pages = _available_pages
	reload_page(available_pages[0])

func reload_page(reference_book_page: ReferenceBookPage):
	switch_page_layout(reference_book_page)
	if reference_book_page.page_layout == 0:
		update_full_page(reference_book_page)
	elif reference_book_page.page_layout == 1:
		update_fish_page(reference_book_page)
	elif reference_book_page.page_layout == 2:
		update_tool_page(reference_book_page)

func _on_next_page_button_pressed() -> void:
	if current_page + 1 < available_pages.size():
		current_page = current_page + 1
		reload_page(available_pages[current_page])

func _on_prev_page_button_pressed() -> void:
	if current_page - 1 >= 0:
		current_page = current_page - 1
		reload_page(available_pages[current_page])

func _on_close_button_pressed() -> void:
	visible = false

# 0 shows full page layout, 1 shows fish page layout
func switch_page_layout(reference_page: ReferenceBookPage) -> void:
	if reference_page.page_layout == 0:
		full_page_chlidren.visible = true
		fish_page_children.visible = false
		tool_page_children.visible = false
	elif reference_page.page_layout == 1:
		full_page_chlidren.visible = false
		fish_page_children.visible = true
		tool_page_children.visible = false
	elif reference_page.page_layout == 2:
		full_page_chlidren.visible = false
		fish_page_children.visible = false
		tool_page_children.visible = true

func update_full_page(reference_book_page: ReferenceBookPage) -> void:
	title_text.text = reference_book_page.title_text
	page_text.text = reference_book_page.page_body_text

func update_fish_page(reference_book_page: ReferenceBookPage) -> void:
	title_text.text = reference_book_page.fish.species
	fish_sprite.texture =  reference_book_page.fish.texture_normal
	fish_desc_label.text = reference_book_page.fish.fish_description
	weight_label.text = "Weight: %dg - %dg" % [reference_book_page.fish.weight_min, reference_book_page.fish.weight_max]
	parasites_label.text = "Parasites: %s" % str(reference_book_page.fish.parasites)
	aura_label.text = "Aura: %s" % reference_book_page.fish.aura
	value_label.text = "Value: %s" % reference_book_page.fish.value
	rarity_label.text = "Rarity: %s" % reference_book_page.fish.rarity
	if reference_book_page.fish.glow:
		glow_label.text = "Should glow"
	else:
		glow_label.text = "Should not glow"

func update_tool_page(reference_book_page: ReferenceBookPage) -> void:
	title_text.text = reference_book_page.title_text
	tool_sprite.texture = reference_book_page.tool_texture
	tool_desc_label.text = reference_book_page.tool_description

func _on_draggable_area_mouse_entered() -> void:
	hovering = true

func _on_draggable_area_mouse_exited() -> void:
	hovering = false
