extends Node3D

@onready var beer_counter = 0
@onready var clue_counter = 0
const start = preload("res://Scene/Freeman_Hall_g.tscn")
#const ending_bad = preload()


func _ready(): 
	var freeman = start.instantiate()
	freeman.position = Vector3(0., 0., 0.)
	add_child(freeman)



func _process(delta):
	if beer_counter < 6:
		pass #bad ending func
	elif clue_counter < 3:
		pass #bad ending func
	else:
		pass #good ending func

#
#func _on_beer_body_entered(body):
	#if body.is_in_group("player"):
		#beer_counter += 1
#func _on_beer_2_body_entered(body):
	#if body.is_in_group("player"):
		#beer_counter += 1
#func _on_beer_3_body_entered(body):
	#if body.is_in_group("player"):
		#beer_counter += 1
#
#func _on_flyer_body_entered(body):
	#if body.is_in_group("player"):
		#clue_counter += 1
