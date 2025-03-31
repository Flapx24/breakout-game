extends Node2D

var pause_menu_scene = preload("res://menu/pause_menu.tscn") 
var level_completed_scene = preload("res://menu/level_completed.tscn")
var game_over_scene = preload("res://menu/game_over.tscn")
var pause_menu
var level_completed
var game_over
var total_bricks = 0
var level_complete_shown = false
var game_over_shown = false
var initialization_complete = false

func _ready():
	for child in get_children():
		if child.name == "BottomBoundary" and child.has_method("setup_controller"):
			child.setup_controller(self)
			print("Controlador configurado para el límite inferior")

	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)

	level_completed = level_completed_scene.instantiate()
	add_child(level_completed)

	game_over = game_over_scene.instantiate()
	add_child(game_over)

	pause_menu.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	level_completed.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	game_over.process_mode = Node.PROCESS_MODE_WHEN_PAUSED

	game_over.visible = false
	level_completed.visible = false

	await get_tree().process_frame
	await get_tree().process_frame
	count_initial_bricks()

func count_initial_bricks():
	total_bricks = get_tree().get_nodes_in_group("Bricks").size()
	print("Ladrillos iniciales: ", total_bricks)
	initialization_complete = true

func _input(event):
	if event.is_action_pressed("Escape"):
		pause_menu.toggle_pause()

func _physics_process(_delta):
	if initialization_complete and total_bricks > 0 and not level_complete_shown and not game_over_shown:
		var current_bricks = get_tree().get_nodes_in_group("Bricks").size()
		if current_bricks == 0:
			print("¡Nivel completado! No quedan ladrillos")
			level_complete_shown = true
			level_completed.show_level_completed()

func show_game_over():
	print("Método show_game_over llamado en level_controller")
	if not game_over_shown:
		print("¡Game Over!")
		game_over_shown = true
		game_over.show_game_over()
