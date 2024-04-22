extends CharacterBody3D

@onready var navigation = $NavigationAgent3D
@export var state = "idle"
const SPEED = 5.0
var target = Vector2(0.,0.)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		state = "idle"
	if is_on_floor():
		match state:
			"idle":
				pass
			"moving":
				navigation.target_position = target.position
				var next_spot = navigation.get_next_path_position()
				velocity = next_spot- position
	move_and_slide()


func _on_vision_body_entered(body):
	print(body)
	if body.is_in_group("player"):
		state = "moving"
		target = body
		navigation.target_position = body.position
		print("i am moving")



func _on_vision_body_exited(body):
	if body.is_in_group("player"):
		state = "idle"
