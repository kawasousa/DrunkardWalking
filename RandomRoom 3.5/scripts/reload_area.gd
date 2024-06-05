extends Area2D


func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
		Global.drunkardPosition = global_position
		Global.maxSteps += 50
