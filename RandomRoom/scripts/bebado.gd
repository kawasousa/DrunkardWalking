extends RigidBody2D

@onready var marker_2d = $Marker2D
var bebado_tamanho = 32
var last_step: int = 1


func _ready():
	global_position = Vector2(512,288)

func _process(delta):
	global_position.clamp(Vector2(112, 80), Vector2(1008, 496))

func random_move() -> void:
	var random_step = randi_range(1, 4)
	if random_step == last_step:
		print("passo igual ao anterior")
		random_move()
	else:
		print("passo diferente do anterior")
		match random_step:
			1:
				global_position.x += bebado_tamanho
				return
			2:
				global_position.x -= bebado_tamanho
				return
			3:
				global_position.y += bebado_tamanho
				return
			4:
				global_position.y -= bebado_tamanho
				return
	last_step = random_step
