extends Area2D


func _on_body_entered(body):
	get_tree().reload_current_scene()
	Global.drunkard_position = global_position
	Global.max_steps += 50
