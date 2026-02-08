
class_name FogNose
extends Fish

# Normal health stats
func spawn(force_healthy: bool = false) -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Fog Nose"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_fog_nose_normal.png")
	new_plaice.fish_description = TextRepo.fish_fog_nose_description
	
	# Normal health stats
	new_plaice.weight_min = 1
	new_plaice.weight_max = 7
	new_plaice.parasites = false
	new_plaice.aura = Aura.CUTE
	new_plaice.value = Value.MID
	new_plaice.rarity = Rarity.RARE
	new_plaice.glow = true
	
	# Taint it, maybe
	if not force_healthy:
		randomize_fish(new_plaice)
	
	return new_plaice
