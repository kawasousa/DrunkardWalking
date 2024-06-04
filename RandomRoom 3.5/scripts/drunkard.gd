extends RigidBody2D

var direction = Vector2.RIGHT.rotated(rotation)


func _ready():
	global_position = Global.drunkard_position

func _process(delta):
	# rotaciona a proxima direção dele
	direction = Vector2.RIGHT.rotated(rotation)
	
	# limites de posicao do drunkard
	global_position.x = clamp(global_position.x, 128, 832)
	global_position.y = clamp(global_position.y, 96, 384)

func random_move() -> void:
	var random_rotation = (randi() % 3 - 1) * 90 # gera tres valores possiveis de angulo (-90, 0, 90)
	rotate(deg2rad(random_rotation)) # rotaciona
	direction = Vector2.RIGHT.rotated(rotation).round() # define a direcao pra onde ele vai
	global_position += direction * 32 # anda 32px pra a direcao desejada, escolhida aleatoriamente
