extends RigidBody2D

var direction = Vector2.RIGHT.rotated(rotation)


func _ready():
	global_position = Global.drunkard_position

func _process(delta):
	direction = Vector2.RIGHT.rotated(rotation)
	global_position.x = clamp(global_position.x, 128, 960)
	global_position.y = clamp(global_position.y, 96, 448)

func random_move() -> void:
	global_position += direction * 32
	var random_rotation = randi_range(-1, 1) * 90
	rotate(deg_to_rad(random_rotation))
