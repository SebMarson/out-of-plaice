
class_name BiImp
extends Fish

# Normal health stats
func spawn() -> Fish:
	var new_plaice = scene.instantiate()
	new_plaice.species = "Bi-Imp"
	new_plaice.texture_normal = preload("res://resources/images/fish/fish_bi_imp_normal.png")
	
	# Normal health stats
	new_plaice.weight_min = 44
	new_plaice.weight_max = 60
	new_plaice.parasites = false
	new_plaice.aura = Aura.INDECISIVE
	new_plaice.value = Value.HIGH
	new_plaice.rarity = Rarity.UNCOMMON
	new_plaice.glow = false
	
	return new_plaice
