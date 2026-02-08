class_name Mouth
extends Node

const PARASITE: String = "A parasite"
const NO_PARASITE: String = "No parasite"


static func get_random() -> String:
	var all_mouth = [PARASITE, NO_PARASITE]
	return all_mouth[randi_range(0, all_mouth.size()-1)]
