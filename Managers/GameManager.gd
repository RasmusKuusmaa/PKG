extends Node

var completed_levels: Dictionary = {}

func complete_level(level_id: String, level_time):
	completed_levels[level_id] = level_time	

func get_level_time(level_id: String):
	if completed_levels.has(level_id):
		return completed_levels[level_id]
