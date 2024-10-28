extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	
	var screen_size = get_viewport_rect().size
	var player_size = $CollisionShape2D.shape.get_rect().size
	
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
	
	# Constrain player position to screen
	position.x = clamp(position.x, 25, screen_size.x - 25)
	position.y = clamp(position.y, 40, screen_size.y - 40)
	
	move_and_slide()
