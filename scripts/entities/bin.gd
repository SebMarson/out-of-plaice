extends Area2D

# todo - move the state to an enum?
# When a fish enters this area, it will have this state set
var state = 0 # 0 = nothing, 1 = destroyed, 2 = sold

func setup(_state: int):
	state = _state

func _on_area_entered(area: Area2D) -> void:
	apply_state(area)

func apply_state(area: Area2D):
	area.get_parent().change_state(state)
