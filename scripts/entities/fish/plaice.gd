
class_name Plaice
extends Fish

# Normal health stats
func spawn() -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Plaice"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_plaice_normal.png")
	
	# Normal health stats
	new_plaice.weight_min = 350
	new_plaice.weight_max = 450
	new_plaice.parasites = false
	new_plaice.aura = Aura.FISHY
	new_plaice.value = Value.LOW
	new_plaice.rarity = Rarity.COMMON
	new_plaice.glow = false
	
	# Taint it, maybe
	randomize_fish(new_plaice)
	
	return new_plaice
		
