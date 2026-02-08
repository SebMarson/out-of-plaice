class_name DayLevel
extends Node

var day_length: int
var available_fish: Array
var available_tools: Array
var available_reference_pages: Array
var required_fish_batches: Array

func _init() -> void:
	available_fish = []
	available_tools = []
	available_reference_pages = []
	required_fish_batches = []
