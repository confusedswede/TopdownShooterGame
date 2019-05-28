extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var target


func _process(delta):
	
	# LOOK AT MOUSE POSITION
	look_at(get_global_mouse_position())
	
	# WASD MOVEMENT
	get_input()
	move_and_slide(velocity)
	
	# SHOOT
	if Input.is_action_just_pressed('shoot'):
		shoot()


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1

	if Input.is_action_pressed('ui_left'):
		velocity.x -=1

	if Input.is_action_pressed('ui_down'):
		velocity.y += 1

	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	velocity = velocity.normalized() * speed



func shoot():
	var bullet = load("res://Scenes/bullet.tscn").instance()
	bullet.position = get_global_position()
	get_parent().add_child(bullet)