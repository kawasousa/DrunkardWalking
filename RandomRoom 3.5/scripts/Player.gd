extends KinematicBody2D
class_name Player

var speed = 5000
onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
var velocity: Vector2
var camera: Camera2D = Camera2D.new()
onready var tween = Tween.new()


func _ready():
	add_child(tween)
	camera.current = true
	camera.limit_top = 0
	camera.limit_left = 0
	camera.smoothing_enabled = true
	camera.smoothing_speed = 20
	add_child(camera)
	tween.interpolate_property(camera, "zoom", Vector2(1,1), Vector2(0.2,0.2), 0.5, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()

func _physics_process(delta):
	movement(delta)
	
	move_and_slide(velocity)

## Controle do movimento do player a partir do teclado
func kboardMovement(delta) -> void:
	velocity =  Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * delta * speed

## Controla o movimento do player a partir do acelerometro
func accelerometerMovement(delta) -> void:
	var directionX = Input.get_accelerometer().x
	var directionY = Input.get_accelerometer().y
	velocity = Vector2(directionX, directionY) * delta * speed

func movement(delta) -> void:
	if Input.get_accelerometer() != Vector3.ZERO:
		accelerometerMovement(delta)
	else:
		kboardMovement(delta)
