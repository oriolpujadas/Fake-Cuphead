extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func  _input(event: InputEvent) -> void:
	if  Input.is_action_just_pressed("space"):
		play_transition_animation()
		await get_tree().create_timer(1.70).timeout
		get_tree().change_scene_to_file("res://Escenas/menu_inicio.tscn")
		
func play_transition_animation():
	if animation_player:
		color_rect.show()
		animation_player.play("transicion")
