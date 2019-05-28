extends KinematicBody2D

var health = 5
var speed = 100

var velocity = Vector2()
var attack_player = false

var player = get_tree().get_root().get_node("game").get_node("Player")


func _process(delta):
	if (attack_player):
		move_to_player()




	print (health)

func move_to_player():
	pass



func on_bullet_hit(area):
	if (area.is_in_group("bullet")):
		health -= 1


func on_player_entered(area):
	pass # Replace with function body.
