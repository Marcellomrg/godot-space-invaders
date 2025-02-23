extends Area2D

class_name Ufo

@export var speed = 200
@onready var ufo_shooting = $UfoShooting
@onready var sprite_2d = $Sprite2D
var explosion_texture = preload("res://Assets Space Invades/Ufo/Ufo-explosion.png")
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _ready():
	audio_stream_player_2d.play()
func _process(delta):
	position.x -= speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area as Laser:
		ufo_shooting.queue_free()
		speed = 0
		sprite_2d.texture = explosion_texture
		await get_tree().create_timer(1).timeout
		queue_free()
		
