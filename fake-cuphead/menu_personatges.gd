extends Control


@export var animation_speed := 1.0
@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.animation = "dance"
	sprite.play()
	sprite.speed_scale = animation_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
