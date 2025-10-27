class_name PuzzlePlayer
extends CharacterBody2D


const ACCELERATION = 5.0
const DECELERATION = 1.0
const ACCELERATION_AFTER_BOUNCE = 0.7


func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	
	var axis_x := Input.get_axis("move_left", "move_right")
	var axis_y := Input.get_axis("move_up", "move_down")
	
	velocity.x += axis_x * ACCELERATION * delta
	velocity.y += axis_y * ACCELERATION * delta
	
	var collision := move_and_collide(velocity)
	if collision:
		velocity *= ACCELERATION_AFTER_BOUNCE
		velocity = velocity.bounce(collision.get_normal())
