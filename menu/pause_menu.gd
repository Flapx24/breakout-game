extends Control

@onready var canvas_layer = $CanvasLayer

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	canvas_layer.visible = false

func toggle_pause():
	canvas_layer.visible = !canvas_layer.visible
	get_tree().paused = canvas_layer.visible

func _input(event):
	if event.is_action_pressed("Escape"):
		toggle_pause()

func _on_play_pressed() -> void:
	toggle_pause()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_levels_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/levels_menu.tscn")

func _on_home_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/main_menu.tscn")
