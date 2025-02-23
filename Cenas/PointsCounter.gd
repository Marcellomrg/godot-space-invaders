extends Node

class_name PointsCounter

signal on_points_increased(points: int)
var points = 0
@onready var invader_spawner = $"../InvaderSpawner" as InvaderSpawner

# Called when the node enters the scene tree for the first time.
func _ready():
	invader_spawner.invader_destroyed.connect(points_increased)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func points_increased(points_to_add: int):
	points += points_to_add
	on_points_increased.emit(points)
	
