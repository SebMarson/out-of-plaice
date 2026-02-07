
class_name Cheese
extends Fish

# Normal health stats
func spawn() -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Cheese"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_cheese_normal.png")
	
	# Normal health stats
	new_plaice.weight_min = 20
	new_plaice.weight_max = 20
	new_plaice.parasites = false
	new_plaice.aura = Aura.STINKY
	new_plaice.value = Value.LOW
	new_plaice.rarity = Rarity.COMMON
	new_plaice.glow = false
	
	# Taint it, maybe
	randomize_fish(new_plaice)
	
	return new_plaice
