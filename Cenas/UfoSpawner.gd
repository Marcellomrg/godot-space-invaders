extends Node2D

@onready var spawn_timer = $SpawnTimer
var ufo_scene = preload("res://Cenas/ufo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	(spawn_timer as SpawnTimer).setup_timer()

func _on_spawn_timer_timeout():
	var ufo = ufo_scene.instantiate()
	ufo.global_position = position
	get_tree().root.add_child(ufo)
	spawn_timer.setup_timer()
	
