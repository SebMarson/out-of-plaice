extends Area2D

@onready var bin_sprite = $BinSprite

# todo - move the state to an enum?
# When a fish enters this area, it will have this state set
var state = 0 # 0 = nothing, 1 = destroyed, 2 = sold

func _ready() -> void:
	if state == 1:
		bin_sprite.texture = load("res://resources/images/environment/environment_trashbin.png")
	elif state == 2:
		bin_sprite.texture = load("res://resources/images/environment/environment_sellbin.png")

func setup(_state: int):
	state = _state

func _on_area_entered(area: Area2D) -> void:
	apply_state(area)

func apply_state(area: Area2D):
	area.get_parent().change_state(state)
