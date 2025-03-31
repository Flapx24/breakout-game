extends StaticBody2D

var textures := []

func _ready() -> void:
	add_to_group("Bricks")
	
	if textures.is_empty():
		for i in range(1,11):
			var image_path = "res://assets/bricks/%d.png" % i
			textures.append(load(image_path))
	var sprite = $Sprite2D
	if sprite and textures.size() > 0:
		sprite.texture = textures[randi() % textures.size()]

	$DetectionArea.body_entered.connect(_on_detection_area_body_entered)

func _on_detection_area_body_entered(body):
	if body is RigidBody2D:
		queue_free()
