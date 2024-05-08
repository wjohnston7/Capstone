extends Control


func _on_quit_pressed():
	get_tree().quit()


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scene/MMenu.tscn")
func _input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_pressed("cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
