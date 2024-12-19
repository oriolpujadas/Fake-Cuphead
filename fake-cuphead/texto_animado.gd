extends AnimatedSprite2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"."

func _ready() -> void:
	animated_sprite_2d.visible = false  # Comienza oculto
	mostrar_y_animar()

func mostrar_y_animar():
	visible = true
	play("textoAnimado")  # Inicia la animación
	animated_sprite_2d.play("textoAnimado")  # Asegura que se reproduzca
	




func _on_animation_looped() -> void:
	stop()
	frame = 0
	animated_sprite_2d.visible = false 
