extends Node2D

var new_floor = preload("res://scenes/floor.tscn")
onready var main_floor = $main_floor
var main_floor_pos
var right_edge_pos 
var curren_edge_pos = 0
var flor = main_floor
var rng = RandomNumberGenerator.new()
onready var camera = $PlayerCharacter/Camera2D
onready var player_character =  $PlayerCharacter
var far = 500
var close

func _physics_process(delta):
	far = player_character.speed / 5
	close = player_character.speed / 10
	

func _ready():
	main_floor.connect("spawn_new",self,"make_new_floor")
	main_floor_pos = main_floor.get_position()
	camera.current = true
	

func _on_killbox_body_entered(body):
	if body.is_in_group("player_character"):
		get_tree().change_scene("res://scenes/main menu.tscn")

func make_new_floor():
	flor = new_floor.instance() 
	main_floor_pos.x = (main_floor_pos.x + main_floor.get_node("CollisionShape2D").get_shape().get_extents().x) + rng.randi_range(close, far)
	flor.set_position(main_floor_pos)
	add_child(flor)
	main_floor = flor
	var vis_node = flor
	vis_node.connect("spawn_new",self,"make_new_floor")

