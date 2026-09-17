extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	#if Input.is_action_pressed('ui_up'):
		#velocity.y = -1*SPEED
		#$kris_sprites.play("andadno_cima")
		#$kris_sprites.flip_h = false
	#if Input.is_action_pressed('ui_down'):
		#velocity.y = SPEED
		#$kris_sprites.play("default")
		#$kris_sprites.flip_h = false
	#if Input.is_action_pressed('ui_right'):
		#velocity.x = SPEED
		#$kris_sprites.play("andando_lado")
		#$kris_sprites.flip_h = true
	#if Input.is_action_pressed('ui_left'):
		#velocity.x = -1*SPEED
		#$kris_sprites.play("andando_lado")
		#$kris_sprites.flip_h = false
		#move_and_slide()
	if velocity.x > 0:
		$kris_sprites.play("andando_lado")
		$kris_sprites.flip_h = true
	if velocity.x < 0:
		$kris_sprites.play("andando_lado")
		$kris_sprites.flip_h = false
	if velocity.y < 0:
		$kris_sprites.play("andadno_cima")
		$kris_sprites.flip_h = false
	if velocity.y > 0:
		$kris_sprites.play("default")
	if position.y != 120:
		move_local_y(1)
		$kris_sprites.play("default")
