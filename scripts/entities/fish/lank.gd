
class_name Lank
extends Fish

# Normal health stats
func spawn() -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Lank"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_lank_normal.png")
	
	# Normal health stats
	new_plaice.weight_min = 4000
	new_plaice.weight_max = 30000
	new_plaice.parasites = true
	new_plaice.aura = Aura.INTENSE
	new_plaice.value = Value.MID
	new_plaice.rarity = Rarity.COMMON
	new_plaice.glow = false
	
	return new_plaice
