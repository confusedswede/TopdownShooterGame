extends KinematicBody2D

var health = 5
var speed = 100
var velocity = Vector2()
var attack_allow = false

onready var player = get_node('../Player')
var timer
var attack_delay = 2
var can_attack = true

func _ready():
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(attack_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)


func _physics_process(delta):
	var dir = (player.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
	look_at(player.position)


	$Label.set_text(String(health))
	$Label.set_rotation(-self.rotation)
	
	
	if (health <= 0):
		queue_free()
		player.player_score += 5

func on_bullet_hit(area):
	if (area.is_in_group("bullet")):
		health -= 1
		

func on_timeout_complete():
	can_attack = true

func _on_enemy_atk_area_entered(area):
	if (area.get_name() == "HB"):
		if (can_attack):
			player.health -= 1
			can_attack = false
			timer.start()