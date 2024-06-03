extends CharacterBody2D

var speed = 5
@onready var nav_agent = $NavigationAgent2D
@onready var InputDirection: Vector2 = global_position
var camera: Camera2D = Camera2D.new()

func _ready():
	add_child(camera)

func _physics_process(delta):
	camera.zoom = camera.zoom.lerp(Vector2(2,2), 0.025)
	if global_position.distance_to(nav_agent.target_position) > 32:
		InputDirection = global_position
	
	InputDirection.x += Input.get_accelerometer().x
	InputDirection.y += -Input.get_accelerometer().y - Global.y_axis_sensibility
	
	nav_agent.target_position = InputDirection
	var direction = nav_agent.get_next_path_position() - global_position
	velocity = direction * speed

	move_and_slide()




