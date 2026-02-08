extends Node

# Information about the day
var current_day: int = 0
var day_timer: Timer
var fish_sold_today: int = 0
var fish_destroyed_today: int = 0

# User stats
var player_money: int = 0

# Current level info
var batch_size: int = 2

# Game info
var corruption: int = 0
var corruption_max: int = 100
var days_in_run: int = 5
var day_length_seconds: int = 25

func _init() -> void:
	# Setup timer
	day_timer = Timer.new()
	day_timer.autostart = false
	day_timer.one_shot = true
	day_timer.connect("timeout", _on_timeout)
	SignalBus.day_timer_start.connect(start_timer)
	add_child(day_timer)
	
	# Connect signals
	SignalBus.sell_fish.connect(_on_fish_sale)
	SignalBus.destroy_fish.connect(_on_fish_destroy)
	
func start_timer(_wait_time: float):
	day_timer.start(_wait_time)
	fish_sold_today = 0
	fish_destroyed_today = 0
	current_day = current_day + 1
	
	# Only do on the first day
	if current_day == 1:
		corruption = 0

func _on_timeout() -> void:
	Audio.play_sfx(SFX.fog_horn)
	SignalBus.day_timer_expired.emit()

func _on_fish_sale(fish) -> void:
	if not fish.tainted:
		player_money = player_money + 1
	else:
		increase_corruption(10)
	fish_sold_today = fish_sold_today + 1

func _on_fish_destroy(fish) -> void:
	if fish.tainted:
		pass
	else:
		pass
	fish_destroyed_today = fish_destroyed_today + 1
	
func increase_corruption(amount: int) -> void:
	corruption = corruption + amount
	if corruption >= corruption_max:
		SignalBus.corruption_peaked.emit()
	else:
		SignalBus.corruption_increase.emit()
