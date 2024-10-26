extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	
	#Move player left, right, up, or down
	var horitzontalDirection := Input.get_axis("ui_left", "ui_right")
	var verticalDirection := Input.get_axis("ui_up", "ui_down")
	
	if horitzontalDirection:
		velocity.x = horitzontalDirection * SPEED
		if (horitzontalDirection < 0):
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.animation = "run"
	else:
		$AnimatedSprite2D.animation = "idle"
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if verticalDirection:
		velocity.y = verticalDirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play()
		
	move_and_slide()
