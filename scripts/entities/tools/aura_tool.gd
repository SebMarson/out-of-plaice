extends Tool

func _ready() -> void:
	custom_minimum_size = ($ToolTexture.size * $ToolTexture.scale)
	tool_type = ToolTypes.AURA

func get_tool_result(fish: Fish) -> String:
	return "THE AURA: " + fish.aura
