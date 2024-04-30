extends CharacterBody3D

@onready var navigation = $"../NavigationRegion3D"
@export var state = "idle"
const SPEED = 5.0
var target = Vector2(0.,0.)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	match state:
		"idle":
			pass
		"moving":
			velocity = target - position
		"dead":
			state = "idle"
			queue_free()
	move_and_slide()
