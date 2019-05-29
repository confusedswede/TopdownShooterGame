extends Node2D

onready var Enemy = load("res://Scenes/enemy.tscn")


func _on_timeout():
	var enemy = Enemy.instance()
	enemy.position = get_position()
	get_parent().add_child(enemy)