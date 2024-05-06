extends Node3D

@onready var beer_counter = 0
@onready var clue_counter = 0
@onready var freeman = start.instantiate()
const start = preload("res://Scene/Freeman_Hall_norm.tscn")
const ending_bad = preload("res://Scene/freeman_hall_b.tscn")
const ending_good = preload("res://Scene/freeman_hall_g.tscn")
const bad_txt = preload("res://Script/bad_ending.gd")
const good_txt = preload("res://Scene/good_ending.tscn")
func _ready(): 
	freeman.position = Vector3(0., 0., 0.)
	add_child(freeman)
	var emitter = get_node("Player")
	emitter.connect("custom_signal", self, "_on_custom_signal")



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


func _on_flyer_body_entered(body):
	if body.is_in_group("player"):
		clue_counter += 1
func _on_flyer_2_body_entered(body):
	if body.is_in_group("player"):
		clue_counter += 1
func _on_flyer_3_body_entered(body):
	if body.is_in_group("player"):
		clue_counter += 1


#func _on_ending_signal_body_entered(body):
	#if body.is_in_group("player") and beer_counter < 6:
		#var bad_ending = ending_bad.instantiate()
		#add_child(bad_ending)
		#remove_child(freeman)
		#$"Ending timer".start()
	#elif body.is_in_group("player") and clue_counter < 3:
		#var bad_ending = ending_bad.instantiate()
		#add_child(bad_ending)
		#remove_child(freeman)
		#$"Ending timer".start()
	#elif body.is_in_group("player") and beer_counter >= 6 and clue_counter >= 3:
		#var good_ending = ending_good.instantiate()
		#add_child(good_ending)
		#remove_child(freeman)
		#$"Ending timer".start()





func _on_ending_signal_body_exited(body):
	if body.is_in_group("player"):
		$"Ending Signal".queue_free()


#func _on_ending_timer_timeout():
	#if beer_counter >= 6:
		#var bad_text = bad_txt.instantiate()
		#add_child(bad_text)
	#else:
		#var good_text = good_txt.instantiate()
		#add_child(good_text)


func _on_ending_signal_2_body_entered(body):
	if body.is_in_group("player") and beer_counter < 6 or clue_counter < 3:
		var bad_ending = ending_bad.instantiate()
		add_child(bad_ending)
		remove_child(freeman)
		$"Ending timer".start()
	elif body.is_in_group("player") and beer_counter >= 6 and clue_counter >= 3:
		var good_ending = ending_good.instantiate()
		add_child(good_ending)
		remove_child(freeman)
		$"Ending timer".start()

