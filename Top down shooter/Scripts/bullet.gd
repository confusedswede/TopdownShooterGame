extends Area2D


const speed = 10
var target
var velocity = Vector2()

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized()
	

func _process(delta):
	position += velocity * speed

func _on_bullet_area_entered(area):
	queue_free()


func on_screen_exited():
	queue_free()
