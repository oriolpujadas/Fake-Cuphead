extends Area2D

@export var speed: float = 500.0
@export var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float):
	position += direction * speed * delta

	# Destruir el proyectil si sale de la pantalla
	if not get_viewport_rect().has_point(global_position):
		queue_free()
