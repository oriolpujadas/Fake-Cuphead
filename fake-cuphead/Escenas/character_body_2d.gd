extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 500.0
const DASH_SPEED = 700.0  # Velocidad del dash
const DASH_DURATION = 0.3  # Duración del dash en segundos
const JUMP_VELOCITY = -700.0

var dash_time = 0.0  # Tiempo restante de dash
var is_dashing = false  # ¿Está el jugador en el dash?

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")  # Declarar la dirección

	# Manejar el Dash
	if is_dashing:
		dash_time -= delta
		if dash_time <= 0:
			is_dashing = false
			animated_sprite_2d.play("idle")  # Vuelve a la animación idle cuando termina el dash
		velocity.x = direction * DASH_SPEED  # Mueve al personaje a velocidad de dash
	else:
		# Movimiento normal
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		# Si presionas shift, inicia el dash
		if Input.is_action_just_pressed("ui_shift") and is_on_floor():
			is_dashing = true
			dash_time = DASH_DURATION  # Establece la duración del dash
			animated_sprite_2d.play("dash")  # Reproduce la animación de dash

	# Añadir gravedad si no está en el suelo
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Manejar salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Actualizar la física (sin pasar argumentos)
	move_and_slide()
