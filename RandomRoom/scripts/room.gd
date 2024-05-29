extends Node2D

var steps = 0
var max_steps = 100
const RASTRO = preload("res://scenes/rastro.tscn")
@onready var bebado = $bebado


func _on_timer_timeout():
	if steps < max_steps:
		var rastro = RASTRO.instantiate()
		bebado.random_move()
		rastro.global_position = bebado.global_position
		get_node("rastro").add_child(rastro)
		steps += 1
