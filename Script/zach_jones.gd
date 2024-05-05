extends CharacterBody3D

@onready var navigation = $NavigationAgent3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var state = "idle"
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var target = Vector3((randf_range(-7, 7)), 0., randf_range(-10, 10))

func _physics_process(delta):
	match state:
		"idle":
			pass
		"moving":
			navigation.target_position = target.position
			var next_target = navigation.get_next_path_position()
			velocity = next_target - position
	
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		state = "moving"
		target = body
		navigation.target_position = body.position


func _on_area_3d_body_exited(body):
	if body.is_in_group("player"):
		state = "idle"
		target = randf_range(-7, 7)
