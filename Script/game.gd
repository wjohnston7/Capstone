extends Node3D

const start = preload("res://Scene/Freeman_Hall_g.tscn")
func _ready(): 
	var freeman = start.instantiate()
	freeman.position = Vector3(0., 0., 0.)
	add_child(freeman)
