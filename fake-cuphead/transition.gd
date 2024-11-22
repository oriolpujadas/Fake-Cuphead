extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("space"):
		play_transition_animation()

func play_transition_animation():
	if animation_player:
		color_rect.show()
		animation_player.play("transition")  # Cambia "fade_in" por el nombre de tu animación
