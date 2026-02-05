extends Node2D

# Internal variables
var current_page: int = 0
var max_page: int = 3

# Children
@onready var page_sprite = $PageSprite
@onready var title_text = $TitleText
@onready var page_text = $PageText

func _ready() -> void:
	# Global settings
	global_position = (get_viewport_rect().size / 2)
	# var scaled_size = (get_viewport_rect().size / 10)
	
	# Child setup
	title_text.text = TextRepo.reference_book_page_zero_title
	page_text.text = TextRepo.reference_book_page_zero_text
	page_text.add_theme_color_override("font_color", Color.BLACK)

func reload_page():
	match current_page:
		0:
			title_text.text = TextRepo.reference_book_page_zero_title
			page_text.text = TextRepo.reference_book_page_zero_text
		1:
			title_text.text = TextRepo.reference_book_page_one_title
			page_text.text = TextRepo.reference_book_page_one_text
		2:
			title_text.text = TextRepo.reference_book_page_two_title
			page_text.text = TextRepo.reference_book_page_two_text
		3:
			title_text.text = TextRepo.reference_book_page_three_title
			page_text.text = TextRepo.reference_book_page_three_text

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
