extends Node2D

@export var laser_scene: PackedScene
var can_player_shoot = true
@onready var audio_stream_player_2d = $"../AudioStreamPlayer2D"

func _input(event):
	if Input.is_action_just_pressed("shoot") && can_player_shoot:
		audio_stream_player_2d.play()
		var laser = laser_scene.instantiate() as Laser
		get_tree().root.add_child(laser)
		laser.global_position = get_parent().global_position - Vector2(0, 20)
		can_player_shoot = false
		laser.tree_exited.connect(_tree_exited)

func _tree_exited():
	can_player_shoot = true
