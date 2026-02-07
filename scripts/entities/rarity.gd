class_name Rarity
extends Node

const COMMON: String = "Common"
const UNCOMMON: String = "Uncommon"
const RARE: String = "Rare"


static func get_random() -> String:
	var all_aura = [COMMON, UNCOMMON, RARE]
	return all_aura[randi_range(0, all_aura.size()-1)]
