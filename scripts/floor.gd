extends StaticBody2D
onready var rand_floor = $CollisionShape2D
var rng = RandomNumberGenerator.new()
signal spawn_new()

func _ready():
	set_friction(0)
	rng.randomize()
	rand_floor.scale.x = rng.randf_range(.1, .65)
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_new_spawn_vis_viewport_exited(viewport):
	emit_signal("spawn_new")
