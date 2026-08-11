extends Node2D

@export var level_id: String = "level_1"

var level_completed:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.position = $SpawnPoint.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finish_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_completed = true
		GM.complete_level(level_id)
		get_tree().change_scene_to_file("res://Scenes/level_selector.tscn")
	
