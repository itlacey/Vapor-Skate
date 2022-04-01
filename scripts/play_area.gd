extends Node2D
onready var rand_floor = $main_floor/CollisionShape2D
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	rand_floor.scale.x = rng.randf_range(.3, 1.0)

func _on_killbox_body_entered(body):
	if body.is_in_group("player_character"):
		get_tree().quit()
	#scene switch code get_tree().change_scene("res://current_scene.tscn")

