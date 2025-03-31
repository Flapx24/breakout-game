extends StaticBody2D

var level_controller = null

func _ready():
	add_to_group("BottomBoundary")
	print("Límite inferior inicializado y añadido al grupo BottomBoundary")

	var detection_area = Area2D.new()
	detection_area.name = "DetectionArea"
	add_child(detection_area)

	var collision_shape = CollisionShape2D.new()
	var shape = $CollisionShape2D.shape.duplicate()
	collision_shape.shape = shape
	detection_area.add_child(collision_shape)

	detection_area.collision_layer = 0
	detection_area.collision_mask = 1

	detection_area.connect("body_entered", _on_detection_area_body_entered)
	
	print("Área de detección creada para el límite inferior")

func setup_controller(controller):
	level_controller = controller
	print("Controlador de nivel vinculado al límite inferior")

func _on_detection_area_body_entered(body):
	print("Cuerpo detectado en límite inferior: ", body.name)

	if body is RigidBody2D:
		print("¡La pelota tocó el límite inferior!")
		if level_controller:
			print("Llamando a show_game_over en el controlador")
			level_controller.show_game_over()
		else:
			var parent = get_parent()
			if parent and parent.has_method("show_game_over"):
				print("Llamando a show_game_over en el nodo padre")
				parent.show_game_over()
