extends CharacterBody3D

@onready var camera_3D = $Neck/Camera3D
@onready var neck = $Neck
@export var clue_counter = 0
@export var beer_counter = 0


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_pressed("cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion:
		camera_3D.rotate_x(-event.relative.y*.001)
		neck.rotate_y(-event.relative.x*.001)
		camera_3D.rotation.x = clamp(camera_3D.rotation.x, deg_to_rad(-60), deg_to_rad(60))


func _on_flyer_body_entered(body):
	if body.is_in_group("player"):
		clue_counter += 1


func _on_flyer_2_body_entered(body):
	if body.is_in_group("player"):
		clue_counter += 1


func _on_flyer_3_body_entered(body):
	if body.is_in_group("player"):
		clue_counter += 1


func _on_beer_body_entered(body):
	if body.is_in_group("player"):
		beer_counter += 1


func _on_beer_2_body_entered(body):
	if body.is_in_group("player"):
		beer_counter += 1


func _on_beer_3_body_entered(body):
	if body.is_in_group("player"):
		beer_counter += 1


func _on_beer_4_body_entered(body):
	if body.is_in_group("player"):
		beer_counter += 1


func _on_beer_5_body_entered(body):
	if body.is_in_group("player"):
		beer_counter += 1


func _on_beer_6_body_entered(body):
	if body.is_in_group("player"):
		beer_counter += 1

