extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
export var gravity = 20
export var jumpForce = 600
var has_double_jumped

func _physics_process(delta):
	motion.y += gravity
	motion.x = 0
	if Input.is_action_just_pressed("ui_up"):
			if is_on_floor():
				jump()
			elif not(has_double_jumped):
				jump()
				has_double_jumped = true
				
	motion = move_and_slide(motion, UP)
	
	if is_on_floor():
		has_double_jumped = false

func jump():
	motion.y = -jumpForce
	
