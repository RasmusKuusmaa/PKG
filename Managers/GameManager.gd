extends Node

var completed_levels: Dictionary = {}

func complete_level(level_id: String):
	completed_levels[level_id] = true

func is_level_completed(level_id: String):
	return completed_levels.has(level_id)
