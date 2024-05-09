extends Node3D

@onready var beer_counter = 0
@onready var freeman = start.instantiate()
const start = preload("res://Scene/Freeman_Hall_norm.tscn")
const ending_bad = preload("res://Scene/freeman_hall_b.tscn")
const ending_good = preload("res://Scene/freeman_hall_g.tscn")
const LT6P_txt = preload("res://Scene/LT6P_txt.tscn")
const good_txt = preload("res://Scene/good_ending.tscn")
const ZJ_txt = preload("res://Scene/zj_txt.tscn")
const fall_txt = preload("res://Scene/fall_txt.tscn")
const bLoc_txt = preload("res://Scene/b_loc_txt.tscn")
func _ready(): 
	freeman.position = Vector3(0., 0., 0.)
	add_child(freeman)

func bad_ending():
	var b_end = ending_bad.instantiate()
	add_child(b_end)
	remove_child(freeman)
	return


func good_ending():
	var g_end = ending_good.instantiate()
	add_child(g_end)
	remove_child(freeman)
	return


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


func _on_ending_signal_body_entered(body): #change bad ending to lessthan6pack ending
	if body.is_in_group("player") and beer_counter < 6:
		bad_ending()
		$"Ending timer".start()
	elif body.is_in_group("player") and beer_counter >= 6:
		good_ending()
		$"Ending timer".start()


func _on_ending_signal_body_exited(body):
	if body.is_in_group("player"):
		$"Ending Signal".queue_free()


func _on_ending_signal_2_body_entered(body):
	if body.is_in_group("player"):
		bad_ending()
		var bLoc = bLoc_txt.instantiate()
		add_child(bLoc)
		return



func _on_player_death():
	bad_ending()
	var ZJ = ZJ_txt.instantiate()
	add_child(ZJ)
	return 


func _on_ending_timer_timeout():
	if beer_counter < 6:
		var bad_text = LT6P_txt.instantiate()
		add_child(bad_text)
	else:
		var good_text = good_txt.instantiate()
		add_child(good_text)
	return


func _on_player_fall():
	get_tree().change_scene_to_file("res://Scene/fall_txt.tscn")
