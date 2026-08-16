extends Node

var completed_levels: Dictionary = {}
var unlocked_lvl = 1

func complete_level(level_id: String, level_time):
	completed_levels[level_id] = level_time	
	increase_unlocked_lvl(level_id)

func get_level_time(level_id: String):
	if completed_levels.has(level_id):
		return completed_levels[level_id]

func increase_unlocked_lvl(level_id):
	var level_number = int(level_id.trim_prefix("level_"))
	unlocked_lvl = max(level_number + 1, unlocked_lvl)
