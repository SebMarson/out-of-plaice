
class_name Aura
extends Node

const FISHY: String = "Fishy"
const STINKY: String = "Stinky"
const CUTE: String = "Hauntingly Cute"
const INDECISIVE: String = "Indecisive"
const INTENSE: String = "Intense"

static func get_random() -> String:
	var all_aura = [FISHY, STINKY, CUTE, INDECISIVE, INTENSE]
	return all_aura[randi_range(0, all_aura.size()-1)]
