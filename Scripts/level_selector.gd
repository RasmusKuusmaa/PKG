extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_level_buttons()
	
func update_level_buttons() -> void:
	if GM.is_level_completed("level_1"):
		$GridContainer/Button.text = "level 1 completed"
	if GM.is_level_completed("level_2"):
		$GridContainer/Button2.text = "level 2 completed"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
