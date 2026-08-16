extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_level_buttons()
	
func update_level_buttons() -> void:
	var lvl1 = GM.get_level_time("level_1")
	var lvl2 = GM.get_level_time("level_2")
	var buttons = $GridContainer.get_children()
	for i in range(buttons.size()):
		var button = buttons[i]
		button.disabled = i + 1 > GM.unlocked_lvl	
		
	if lvl1 != null:
		$GridContainer/Button.text = "Level 1 - %.2f seconds" % lvl1

	if lvl2 != null:
		$GridContainer/Button2.text = "Level 2 - %.2f seconds" % lvl2
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
