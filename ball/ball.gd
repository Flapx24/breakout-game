extends RigidBody2D

var speed = 400

func _ready():
	var direction_x = [-1, 1].pick_random()
	var direction = Vector2(direction_x, -1)
	linear_velocity = direction.normalized() * speed

func _physics_process(delta):
	if linear_velocity.length() != 0:
		linear_velocity = linear_velocity.normalized() * speed

func _on_body_entered(body):
	if body.name.begins_with("Brick"):
		body.queue_free()
