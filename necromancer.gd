extends CharacterBody2D

const SPEED = [300.0, 350.0, 400.0, 450.0]

func _physics_process(delta: float) -> void:

	move_and_slide()
