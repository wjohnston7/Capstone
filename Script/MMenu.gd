extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/text_intro.tscn")


func _on_credits_pressed():
	pass # Replace with function body.


func _on_info_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()


func _input(event):
	if Input.is_action_just_pressed("cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
