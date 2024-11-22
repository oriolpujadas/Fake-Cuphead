extends Control
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var options_button: Button = $VBoxContainer/OptionsButton

# Lista de botones en orden
var buttons = []
var current_index = 0  # Índice del botón actualmente enfocado

func _ready():
	# Inicializamos la lista de botones
	buttons = [start_button, options_button]
	
	# Establecemos el foco inicial
	buttons[current_index].grab_focus()

func _input(event):
	if event.is_action_pressed("up"):  # W o dirección arriba
		move_focus(-1)
	elif event.is_action_pressed("down"):  # S o dirección abajo
		move_focus(1)

func move_focus(direction):
	# Cambia el índice del botón actual
	current_index = (current_index + direction) % buttons.size()
	if current_index < 0:
		current_index = buttons.size() - 1  # Para mover hacia atrás
	
	# Cambia el foco al botón correspondiente
	buttons[current_index].grab_focus()
