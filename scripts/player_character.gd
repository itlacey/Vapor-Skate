extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
export var gravity = 20
export var jumpForce = 525
var has_double_jumped
var has_dashed
var speed = 500
onready var label = $Camera2D/CanvasLayer/RichTextLabel
var score = 0
var currently_dashing = false
onready var dash_timer = $Camera2D/CanvasLayer/dash_timer

func _physics_process(delta):
	motion.y += gravity
	if currently_dashing:
		motion.x = speed * 10
	else:
		motion.x = speed
				
	motion = move_and_slide(motion, UP )
	score = self.position.x
	var x = OS.get_screen_size().x
	var y = OS.get_screen_size().y
	label.text =  "SCORE {score}".format({"score": int(score)})
	if is_on_floor():
		has_double_jumped = false
		has_dashed = false

func jump():
	motion.y = -jumpForce

func dash():
	currently_dashing = true
	dash_timer.start()

	
func _on_Timer_timeout():
	speed = speed + 5
	
	


func _on_jump_area_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		if is_on_floor():
			jump()
		elif not(has_double_jumped):
			jump()
			has_double_jumped = true


func _on_dash_area_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		if event.is_pressed():
			if is_on_floor():
				dash()
			elif not(has_dashed):
				dash()
				has_dashed = true


func _on_dash_timer_timeout():
	currently_dashing = false


