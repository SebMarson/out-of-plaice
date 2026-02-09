extends Tool

func _ready() -> void:
	custom_minimum_size = ($ToolTexture.size * $ToolTexture.scale)
	tool_type = ToolTypes.LENS

func get_tool_result(fish: Fish) -> String:
	return "DOES THE FISH GLOW?... " + str(fish.glow)
