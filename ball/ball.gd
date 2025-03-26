extends RigidBody2D

var speed = 400

# Dirección de movimiento inicial
var direction = Vector2(1, -1)

func _ready():
	linear_velocity = direction.normalized() * speed

func _physics_process(delta):
	if linear_velocity.length() != 0:
		linear_velocity = linear_velocity.normalized() * speed

func _on_body_entered(body):
	if body.name.begins_with("Brick"):
		body.queue_free()
