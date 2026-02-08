extends Tool

func _ready() -> void:
	custom_minimum_size = ($ToolTexture.size * $ToolTexture.scale)

func get_tool_result(fish: Fish) -> String:
	return "There is a... " + str(fish.mouth)
