extends CanvasLayer

@onready var margin_container = $MarginContainer
@onready var points_label = $MarginContainer/PointsLabel
@onready var lifes_container = $MarginContainer/LifesContainer
@onready var game_over_container = $MarginContainer/GameOverContainer
@onready var game_over_label = %GameOverLabel
@onready var game_over_button = %GameOverButton

@onready var invader_spawner = $"../InvaderSpawner" as InvaderSpawner
@onready var life_manager = $"../LifeManager" as LifeManager
@onready var points_counter = $"../PointsCounter" as PointsCounter

var life_texture = preload("res://Assets Space Invades/Player/Player.png")

func _ready():
	points_label.text = "SCORE = %d" % 0   
	points_counter.on_points_increased.connect(points_incread)
	life_manager.life_lost.connect(on_life_lost)
	invader_spawner.game_lost.connect(on_game_lost)
	invader_spawner.game_won.connect(on_game_won)
	
	for i in range(life_manager.lifes):
		var life_texture_rect = TextureRect.new()
		life_texture_rect.texture = life_texture
		life_texture_rect.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		life_texture_rect.custom_minimum_size = Vector2(40, 25)
		life_texture_rect.expand_mode = TextureRect.EXPAND_KEEP_SIZE
		lifes_container.add_child(life_texture_rect)
		
	
func points_incread(points: int):
	points_label.text = "SCORE = %d" % points

func on_life_lost(lifes: int):
		var life_texture_rect = lifes_container.get_child(lifes)
		life_texture_rect.queue_free()
		if lifes <= 0:
			on_game_lost()
	
func on_game_lost():
	game_over_container.visible = true 

func on_game_won():
	game_over_container.visible = true
	game_over_label.text + "You won"
	game_over_label.add_theme_color_override("font_color", Color.GREEN)
	game_over_button.modulate = Color(0,1,0,1)

func _on_game_over_button_pressed():
	get_tree().reload_current_scene()
