extends CharacterBody2D

var speed = 10
@onready var nav_agent = $NavigationAgent2D
@onready var InputDirection = global_position


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		InputDirection += Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		InputDirection += Vector2.LEFT
	if Input.is_action_pressed("ui_up"):
		InputDirection += Vector2.UP
	elif Input.is_action_pressed("ui_down"):
		InputDirection += Vector2.DOWN
	
	if global_position.distance_to(nav_agent.target_position) > 32:
		InputDirection = global_position
	
	nav_agent.target_position = InputDirection
	var direction = nav_agent.get_next_path_position() - global_position
	velocity = direction

	move_and_slide()
