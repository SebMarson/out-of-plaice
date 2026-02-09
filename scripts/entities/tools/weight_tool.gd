extends Tool

func _ready() -> void:
	custom_minimum_size = ($ToolTexture.size * $ToolTexture.scale)
	tool_type = ToolTypes.WEIGHT

func get_tool_result(fish: Fish) -> String:
	return "THE WEIGHT: " + str(fish.weight)
