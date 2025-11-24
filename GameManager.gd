extends Node

signal game_over

var is_game_over : bool = false

func _ready():
	# Connect to all enemies in the scene
	await get_tree().process_frame
	connect_to_enemies()

func connect_to_enemies():
	var enemies = get_tree().get_nodes_in_group("Enemy")
	for enemy in enemies:
		if enemy.has_signal("player_caught"):
			enemy.player_caught.connect(_on_player_caught)

func _on_player_caught():
	if is_game_over:
		return
	
	is_game_over = true
	emit_signal("game_over")
	trigger_game_over()

func trigger_game_over():
	print("GAME OVER!")
	get_tree().paused = true
	# Show game over screen or change scene
	# get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func restart_game():
	is_game_over = false
	get_tree().paused = false
	get_tree().reload_current_scene()
