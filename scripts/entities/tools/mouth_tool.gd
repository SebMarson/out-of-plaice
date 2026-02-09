extends Tool

func _ready() -> void:
	custom_minimum_size = ($ToolTexture.size * $ToolTexture.scale)
	tool_type = ToolTypes.MOUTH

func get_tool_result(fish: Fish) -> String:
	if fish.parasites:
		return "para"
	else:
		return "nopara"
	#return "Is there a parasite? " + str(fish.parasites)
