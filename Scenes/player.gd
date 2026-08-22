extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 1800.0
const FRICTION = 1400.0
const JUMP_VELOCITY = -400.0
const COYOTE_TIME = 0.12
const JUMP_BUFFER_TIME = 0.12

var jump_buffer_timer := 0.0
var coyote_timer := 0.0
@onready var tilemap = $"../TileMapLayer"


func _physics_process(delta: float) -> void:
	# Add gravity
	if is_on_floor():
		coyote_timer = COYOTE_TIME
	else:
		coyote_timer -= delta
		velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer_timer = JUMP_BUFFER_TIME
	else:
		jump_buffer_timer -= delta
		
	if jump_buffer_timer > 0 and coyote_timer > 0:
		velocity.y = JUMP_VELOCITY
		coyote_timer = 0
		jump_buffer_timer = 0

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = move_toward(
			velocity.x,
			direction * SPEED,
			ACCELERATION * delta
		)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

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
