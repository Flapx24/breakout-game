extends StaticBody2D

var textures := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if textures.is_empty():
		for i in range(1,11):
			var image_path = "res://assets/bricks/%d.png" % i
			textures.append(load(image_path))
	var sprite = $Sprite2D
	if sprite and textures.size() > 0:
		sprite.texture = textures[randi() % textures.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
