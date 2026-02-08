
class_name Plaice
extends Fish

# Normal health stats
func spawn(force_healthy: bool = false) -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Plaice"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_plaice_normal.png")
	new_plaice.fish_description = TextRepo.fish_plaice_description
	
	# Normal health stats
	new_plaice.weight_min = 350
	new_plaice.weight_max = 450
	new_plaice.parasites = false
	new_plaice.aura = Aura.FISHY
	new_plaice.value = Value.LOW
	new_plaice.rarity = Rarity.COMMON
	new_plaice.glow = false
	
	# Taint it, maybe
	if not force_healthy:
		randomize_fish(new_plaice)
	
	return new_plaice
		
