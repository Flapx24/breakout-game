extends Control

func _ready():
	visible = false
	$CanvasLayer.visible = false
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func show_level_completed():
	print("Mostrando nivel completado")
	$CanvasLayer.visible = true
	get_tree().paused = true
	print("Pausa establecida:", get_tree().paused)

func _on_restart_pressed():
	print("Reiniciando nivel")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_levels_pressed():
	print("Volviendo a selección de niveles")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/levels_menu.tscn")
