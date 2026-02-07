
class_name FogNose
extends Fish

# Normal health stats
func spawn() -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Fog Nose"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_fog_nose_normal.png")
	
	# Normal health stats
	new_plaice.weight_min = 1
	new_plaice.weight_max = 7
	new_plaice.parasites = false
	new_plaice.aura = Aura.CUTE
	new_plaice.value = Value.MID
	new_plaice.rarity = Rarity.RARE
	new_plaice.glow = true
	
	return new_plaice
