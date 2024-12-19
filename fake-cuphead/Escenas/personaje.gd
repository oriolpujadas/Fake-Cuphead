extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("run")  # Cambia a la animación run
	elif Input.is_action_pressed("ui_left"):
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("run")
	elif Input.is_action_pressed("ui_down"):
		animated_sprite_2d.play("duck")
	elif Input.is_action_pressed("space"):
		animated_sprite_2d.play("jump")
	elif Input.is_action_pressed("dash"):
		animated_sprite_2d.play("dash")
	elif(animated_sprite_2d.animation_finished):
		animated_sprite_2d.play("idle")  # Vuelve a la animación "idle"
