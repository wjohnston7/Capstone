extends CanvasLayer


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scene/game.tscn")

func _input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scene/game.tscn")
