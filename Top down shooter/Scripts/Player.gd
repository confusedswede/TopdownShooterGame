extends KinematicBody2D

onready var player_score_text = get_node("../Player_score")


var speed = 250
var velocity = Vector2()
var health = 5
var player_score = 0

func _process(delta):
	
	# LOOK AT MOUSE POSITION
	look_at(get_global_mouse_position())
	
	# WASD MOVEMENT
	get_input()
	move_and_slide(velocity)
	
	# SHOOT
	if Input.is_action_just_pressed('shoot'):
		shoot()
	
	
	if (health<= 0):
		get_tree().change_scene("res://Scenes/main_menu.tscn")
	
	$health_text.set_text(String(health))
	$health_text.set_rotation(-self.rotation)
	
	player_score_text.set_text("Score:" + String(player_score))


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
	bullet.position = $player_gun.get_global_position()
	get_parent().add_child(bullet)

func _on_HB_area_entered(area):
	if (area.get_tree().get_nodes_in_group("enemies")):
		health -=1