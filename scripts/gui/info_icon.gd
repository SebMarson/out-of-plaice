extends Control

# Child objects
@onready var bar_background_sprite: Sprite2D = $BarBackgroundSprite
@onready var corruption_bar: TextureProgressBar = $CorruptionBar
@onready var clock_sprite: Sprite2D = $ClockSprite
@onready var hour_hand_sprite: Sprite2D = $HourHandSprite
@onready var minute_hand_sprite: Sprite2D = $MinuteHandSprite

# Variables
var _scale = Vector2(0.5, 0.5)

func _ready() -> void:
	bar_background_sprite.scale = _scale
	corruption_bar.scale = _scale
	clock_sprite.scale = _scale
	hour_hand_sprite.scale = _scale
	minute_hand_sprite.scale = _scale

func _process(_delta) -> void:
	# Calc current time on clock
	var day_percent_done = GameState.day_timer.time_left / GameState.day_length_seconds
	var degrees = 360 * day_percent_done * -1
	minute_hand_sprite.rotation_degrees = degrees
	
	# Calc corruption displayed
	var corruption_percent = (float(GameState.corruption) / GameState.corruption_max) * 100
	var corruption_offset = 0.8
	corruption_bar.value = corruption_percent * corruption_offset
