extends Node2D

var steps: int = 0
var maxSteps: int = Global.max_steps
var playerSpawned: bool = false
var areaSpawned: bool = false
const PLAYER = preload("res://scenes/Player.tscn")
const RELOAD_AREA = preload("res://scenes/Reload_area.tscn")
onready var drunkard = $drunkard
onready var tileMap: TileMap = $TileMap
onready var player_spawn_position = drunkard.global_position


func _ready():
	randomize() # rng

func _process(delta):
	set_tileset()
	
	if steps == maxSteps:
		spawn_player()
		spawn_area()

## Adiciona o player na cena
func spawn_player() -> void:
	if playerSpawned == false:
		var player = PLAYER.instance()
		player.global_position = player_spawn_position
		add_child(player)
		playerSpawned = true

## Adiciona o objetivo na cena.
func spawn_area():
	if areaSpawned == false:
		var area = RELOAD_AREA.instance()
		area.global_position = drunkard.global_position
		add_child(area)
		areaSpawned = true

## Apaga a célula na posição onde o Drunkard está.
func set_tileset() -> void:
	tileMap.set_cellv(drunkard.global_position / 32, 0) # define a celula para o tieleset[0], uma que nao tem colisao


## Delay de movimento do drunkard
func _on_Timer_timeout():
	if steps < maxSteps:
		randomize()
		drunkard.random_move()
		steps += 1
