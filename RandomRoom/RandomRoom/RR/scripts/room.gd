extends Node2D

var steps = 0
var max_steps = Global.max_steps
var player_spawned: bool = false
var area_spawned: bool = false
const PLAYER = preload("res://scenes/Player.tscn")
const AREA = preload("res://scenes/area_2d.tscn")
@onready var drunkard = $drunkard
@onready var tile_map: TileMap = $TileMap
@onready var slider: VSlider = $CanvasLayer/VSlider
@onready var player_spawn_position = drunkard.global_position


func _ready():
	randomize()
	slider.value = Global.y_axis_sensibility
	tile_map.set_cell(0, Vector2i(drunkard.global_position/32), 0, Vector2i.ZERO, 0)

func _process(delta):
	Global.y_axis_sensibility = slider.value
	if steps == max_steps:
		spawn_area()
		spawn_player()

func _on_timer_timeout():
	if steps < max_steps:
		drunkard.random_move()
		var drunkard_position: Vector2 = drunkard.global_position / 32
		tile_map.set_cell(0, drunkard_position, 0, Vector2i.ZERO, 0)
		steps += 1

func spawn_player() -> void:
	var player = PLAYER.instantiate()
	if player_spawned == false:
		player.global_position = player_spawn_position
		add_child(player)
		player_spawned = true

func spawn_area():
	if area_spawned == false:
		var area = AREA.instantiate()
		area.global_position = drunkard.global_position
		add_child(area)
		area_spawned = true

func _on_texture_button_pressed():
	get_tree().reload_current_scene()

