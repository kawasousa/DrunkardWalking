extends CharacterBody2D

const SPEED = 1000
@onready var navigation_agent_2d = $NavigationAgent2D


func _physics_process(delta):
	navigation_agent_2d.target_position = get_global_mouse_position()
	var direction = Vector3()
	direction = navigation_agent_2d.get_next_path_position() - global_position
	velocity = direction * 2
	#var directionX = Input.get_axis("ui_left", "ui_right")
	#var directionY = Input.get_axis("ui_up", "ui_down")
	#if directionX != 0:
		#velocity.x = directionX * SPEED
	#else:
		#velocity.x = 0
	#
	#if directionY != 0:
		#velocity.y = directionY * SPEED
	#else:
		#velocity.y = 0

	move_and_slide()
