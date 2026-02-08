extends Tool

const possible_sound_effects = [SFX.badfish_bleghspit, SFX.badfish_eurgghhdisgusting, 
	SFX.badfish_slurperugherugh, SFX.badfish_slurplipsmackeughh, 
	SFX.goodfish_ahhh, SFX.goodfish_yummy, 
	SFX.goodfish_delicious, SFX.goodfish_lipsmackingyeah, 
	SFX.goodfish_mmm, SFX.goodfish_nice, SFX.goodfish_nice, SFX.goodfish_slurplipsmackmmm]

func _ready() -> void:
	custom_minimum_size = ($ToolTexture.size * $ToolTexture.scale)

func get_tool_result(fish: Fish) -> String:
	Audio.play_sfx(possible_sound_effects[randi_range(0, possible_sound_effects.size()-1)])
	return "HOW DOES IT TASTE?... LIKE THE INSIDE OF JONAS' MOUTH" 
