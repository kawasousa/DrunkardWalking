extends Label


func _on_timer_timeout():
	text = str("steps: ", Global.max_steps, "\nx: ", snapped(Input.get_accelerometer().x, 0.01), " | y: ", snapped(Input.get_accelerometer().y, 0.01), " | z: ", snapped(Input.get_accelerometer().z, 0.01))
