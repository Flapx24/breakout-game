extends CharacterBody2D

const SPEED = 600.0

func _physics_process(delta:):
	var direction = Input.get_vector("move_left","move_rigth", "none", "none")
	velocity = direction * SPEED
	move_and_slide()
