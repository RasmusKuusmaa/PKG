extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var tilemap = $"../TileMapLayer"


func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	check_deadly_tile()


func respawn():
	print("fe")
	global_position = $"../SpawnPoint".global_position


func check_deadly_tile():
	if self.position.y > 2000:
		respawn()
	var check_position = global_position + Vector2(0, 50)
	var cell = tilemap.local_to_map(tilemap.to_local(check_position))
	var data = tilemap.get_cell_tile_data(cell)
	if data and data.get_custom_data("deadly") == true:
		respawn()
