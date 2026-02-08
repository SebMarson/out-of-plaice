
class_name Lank
extends Fish

# Normal health stats
func spawn(force_healthy: bool = false) -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Lank"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_lank_normal.png")
	new_plaice.fish_description = TextRepo.fish_lank_description
	
	# Normal health stats
	new_plaice.weight_min = 4000
	new_plaice.weight_max = 30000
	new_plaice.parasites = true
	new_plaice.aura = Aura.INTENSE
	new_plaice.value = Value.MID
	new_plaice.rarity = Rarity.COMMON
	new_plaice.glow = false
	
	# Taint it, maybe
	if not force_healthy:
		randomize_fish(new_plaice)
	
	return new_plaice
