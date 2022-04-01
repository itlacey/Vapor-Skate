extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,0)

func _process(delta):
	motion.x = -500
	motion = move_and_slide(motion, UP)
