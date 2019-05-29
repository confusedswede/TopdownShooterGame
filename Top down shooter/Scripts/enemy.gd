extends KinematicBody2D

var health = 5
var speed = 100

var velocity = Vector2()

onready var player = get_node('../Player')


func _physics_process(delta):
	var dir = (player.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
	look_at(player.position)
	
	$Label.set_text(String(health))
	$Label.set_rotation(-self.rotation)
	
	if (health <= 0):
		queue_free()

func on_bullet_hit(area):
	if (area.is_in_group("bullet")):
		health -= 1
		