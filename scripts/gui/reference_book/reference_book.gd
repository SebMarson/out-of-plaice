extends Node2D

# Internal variables
var current_page: int = 0
var max_page: int = 5

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
	
	# Child setup
	switch_page_layout(0)
	update_full_page("zero")
	page_text.add_theme_color_override("font_color", Color.BLACK)

func reload_page():
	match current_page:
		0:
			switch_page_layout(0)
			update_full_page("zero")
		1:
			switch_page_layout(1)
			update_fish_page("one")
		2:
			switch_page_layout(1)
			update_fish_page("two")
		3:
			switch_page_layout(1)
			update_fish_page("three")
		4:
			switch_page_layout(1)
			update_fish_page("four")
		5:
			switch_page_layout(1)
			update_fish_page("five")

func _on_next_page_button_pressed() -> void:
	if current_page + 1 <= max_page:
		current_page = current_page + 1
		reload_page()

func _on_prev_page_button_pressed() -> void:
	if current_page - 1 >= 0:
		current_page = current_page - 1
		reload_page()


func _on_close_button_pressed() -> void:
	visible = false

# 0 shows full page layout, 1 shows fish page layout
func switch_page_layout(_value: int) -> void:
	if _value == 0:
		full_page_chlidren.visible = true
		fish_page_children.visible = false
	if _value == 1:
		full_page_chlidren.visible = false
		fish_page_children.visible = true
	
func update_full_page(index: String) -> void:
	if "reference_book_page_" + index + "_title" in TextRepo:
		title_text.text = TextRepo.get("reference_book_page_" + index + "_title")
		page_text.text = TextRepo.get("reference_book_page_" + index + "_text")
	else:
		print("No reference page for index: " + index)
		title_text.text = "Loris"
		page_text.text = "Lepsum, something went wrong..."

func update_fish_page(index: String) -> void:
	if "reference_book_page_" + index + "_title" in TextRepo:
		title_text.text = TextRepo.get("reference_book_page_" + index + "_title")
		fish_sprite.texture = load(TextRepo.get("reference_book_page_" + index + "_fish_texture"))
		fish_desc_label.text = TextRepo.get("reference_book_page_" + index + "_desc")
		weight_label.text = weight_template % TextRepo.get("reference_book_page_" + index + "_weight")
		parasites_label.text = parasites_template % TextRepo.get("reference_book_page_" + index + "_parasites")
		aura_label.text = aura_template % TextRepo.get("reference_book_page_" + index + "_aura")
		value_label.text = value_template % TextRepo.get("reference_book_page_" + index + "_value")
		rarity_label.text = rarity_template % TextRepo.get("reference_book_page_" + index + "_rarity")
		glow_label.text = TextRepo.get("reference_book_page_" + index + "_glow")
	else:
		print("No reference page for index: " + index)
		title_text.text = "Loris"
		page_text.text = "Lepsum, something went wrong..."
