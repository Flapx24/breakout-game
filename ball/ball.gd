extends RigidBody2D

var speed = 450

func _ready():
	linear_damp = 0
	var direction_x = [-1, 1].pick_random()
	var direction = Vector2(direction_x, -1)
	linear_velocity = direction.normalized() * speed

	if not is_connected("body_entered", _on_body_entered):
		connect("body_entered", _on_body_entered)
		print("Señal body_entered conectada")

func _physics_process(delta):
	if linear_velocity.length() != 0:
		linear_velocity = linear_velocity.normalized() * speed

		var bottom = get_node("../BottomBoundary")
		if bottom and bottom.has_method("ball_collision"):
			bottom.ball_collision(self)

func _on_body_entered(body):
	print("Colisión detectada con: ", body.name, " (", body.get_path(), ")")
	
	if body.is_in_group("Bricks"):
		body.queue_free()
	
	if body.name == "BottomBoundary" or body.is_in_group("BottomBoundary"):
		print("¡La bola tocó el límite inferior!")
		if body.has_method("ball_collision"):
			body.ball_collision(self)
