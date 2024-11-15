extends Label

@onready var any_button_timer: Timer = $any_button_timer


func _ready() -> void:
	any_button_timer.start()



func _process(delta: float) -> void:
	pass


func _on_any_button_timer_timeout() -> void:
	visible = not visible
	
