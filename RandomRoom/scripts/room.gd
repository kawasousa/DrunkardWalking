extends Node2D

var steps = 0
var max_steps = 100
var player_spawned: bool = false
const PLAYER = preload("res://scenes/Player.tscn")
@onready var drunkard = $drunkard
@onready var tile_map: TileMap = $TileMap
@onready var timer = $Timer
@onready var player_spawn_position = drunkard.global_position


func _ready():
	tile_map.set_cell(0, Vector2i(drunkard.global_position/32), 0, Vector2i.ZERO, 0)

func _process(delta):
	## Debug to pause timer in game
	if Input.is_action_just_pressed("ui_accept"):
		timer.paused = !timer.paused
	
	if steps == max_steps:
		spawn_player()

func _on_timer_timeout():
	if steps < max_steps:
		drunkard.random_move()
		var drunkard_position: Vector2 = drunkard.global_position / 32
		tile_map.set_cell(0, drunkard_position, 0, Vector2i.ZERO, 0)
		steps += 1

func spawn_player() -> void:
	if player_spawned == false:
		var player = PLAYER.instantiate()
		player.global_position = player_spawn_position
		add_child(player)
		player_spawned = true
