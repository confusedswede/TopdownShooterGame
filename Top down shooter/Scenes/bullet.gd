extends Area2D


const speed = 10
var target
var velocity = Vector2()

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized()
	

func _process(delta):
	position += velocity * speed