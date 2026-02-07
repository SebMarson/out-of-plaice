class_name Value
extends Node

const LOW: String = "Low"
const MID: String = "Medium"
const HIGH: String = "High"

static func get_random() -> String:
	var all_aura = [LOW, MID, HIGH]
	return all_aura[randi_range(0, all_aura.size()-1)]
