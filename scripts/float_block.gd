extends StaticBody2D
signal spawn_new_float()

func _ready():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	emit_signal("spawn_new_float")
	
	


func _on_Area2D_body_entered(body):
	if body.get("currently_dashing") == true and body.is_in_group("player_character"):
		queue_free()
		emit_signal("spawn_new_float")
	elif body.get("currently_dashing") == false and body.is_in_group("player_character"):
		get_tree().change_scene("res://scenes/main menu.tscn")
