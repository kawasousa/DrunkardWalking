extends Node2D

var steps: int = 0
var maxSteps: int = Global.maxSteps
var playerSpawned: bool = false
var areaSpawned: bool = false
const PLAYER = preload("res://scenes/Player.tscn")
const RELOAD_AREA = preload("res://scenes/Reload_area.tscn")
onready var drunkard = $drunkard
onready var tileMap: TileMap = $TileMap
onready var player_spawn_position = drunkard.global_position


func _ready():
	randomize() # Aumenta a aleatoriedade na criação do mapa
	fillTileScreen()
	

func _process(delta):
	setTrackTileset()
	
	if steps == maxSteps:
		spawnPlayer()
		spawnArea()

## Adiciona o player na cena
func spawnPlayer() -> void:
	if playerSpawned == false:
		var player = PLAYER.instance()
		player.global_position = player_spawn_position
		add_child(player)
		playerSpawned = true

## Adiciona o objetivo na cena.
func spawnArea():
	if areaSpawned == false:
		var area = RELOAD_AREA.instance()
		area.global_position = drunkard.global_position
		add_child(area)
		areaSpawned = true

## Apaga a célula na posição onde o Drunkard está.
func setTrackTileset() -> void:
	var drunkardLocalPosition = tileMap.to_local(drunkard.global_position)
	var cellPosition = tileMap.world_to_map(drunkardLocalPosition) # Converte a posição atual do drunkard para uma posição de célula no Tilemap.
	tileMap.set_cellv(cellPosition, 0) # define a celula para o tieleset[0], uma que nao tem colisao

func fillTileScreen() -> void:
	var startCell = tileMap.world_to_map(Vector2.ZERO)
	var finishCell = tileMap.world_to_map(get_viewport().size)
	for xCell in range(startCell.x, finishCell.x + 1):
		for yCell in range(startCell.y, finishCell.y + 1):
			tileMap.set_cellv(Vector2(xCell, yCell), 1)

## Delay de movimento do drunkard
func _on_Timer_timeout():
	if steps < maxSteps:
		randomize()
		drunkard.randomMove()
		steps += 1
