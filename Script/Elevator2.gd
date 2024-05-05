extends AnimatableBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape3D/AnimationPlayer.play("Up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
