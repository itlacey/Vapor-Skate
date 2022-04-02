extends Node2D

var new_floor = preload("res://scenes/floor.tscn")
onready var main_floor = $main_floor
var main_floor_pos

func _ready():
	main_floor.connect("spawn_new",self,"make_new_floor")
	main_floor_pos = main_floor.get_position()

func _on_killbox_body_entered(body):
	if body.is_in_group("player_character"):
		get_tree().quit()
	#scene switch code get_tree().change_scene("res://current_scene.tscn")

func make_new_floor():
	var flor = new_floor.instance()
	var main_floor_shape = main_floor.get_node("CollisionShape2D").shape
	print(main_floor_shape)
	main_floor_pos.x = main_floor_pos.x + 1030
	flor.set_position(main_floor_pos)
	add_child(flor)
	main_floor = flor
	var vis_node = flor
	vis_node.connect("spawn_new",self,"make_new_floor")

