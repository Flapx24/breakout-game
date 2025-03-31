extends Control

func _ready():
	visible = false
	if has_node("CanvasLayer"):
		$CanvasLayer.visible = false
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	print("Game Over inicializado y oculto")

func show_game_over():
	print("Mostrando Game Over")
	visible = true
	if has_node("CanvasLayer"):
		$CanvasLayer.visible = true
	get_tree().paused = true
	print("Juego pausado: ", get_tree().paused)

func _on_restart_pressed():
	print("Reiniciando nivel")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_levels_pressed():
	print("Volviendo a menú de niveles")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/levels_menu.tscn")

func _on_home_pressed():
	print("Volviendo al menú principal")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/main_menu.tscn")
