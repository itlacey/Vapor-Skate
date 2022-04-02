extends Area2D
onready var player = get_node("../PlayerCharacter")
var player_pos 

func _physics_process(delta):
	player_pos = player.get_position()
	self.position.x = player_pos.x
