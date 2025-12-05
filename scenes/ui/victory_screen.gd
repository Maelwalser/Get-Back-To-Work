extends Control

@onready var restart_button = $VBoxContainer/RestartButton
@onready var menu_button = $VBoxContainer/MenuButton
@onready var quit_button = $VBoxContainer/QuitButton


func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
	mouse_filter = Control.MOUSE_FILTER_STOP
	
	if restart_button:
		restart_button.pressed.connect(_on_restart_button_pressed)
	if menu_button:
		menu_button.pressed.connect(_on_menu_button_pressed)
	if quit_button:
		quit_button.pressed.connect(_on_quit_button_pressed)	
	
func show_victory():
	show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	
func _on_restart_button_pressed():
	GameManager.restart_game()
	
func _on_menu_button_pressed():
	GameManager.go_to_main_menu()
	
func _on_quit_button_pressed():
	get_tree().quit()
