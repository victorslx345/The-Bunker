extends CharacterBody2D

@export var mover = true
const SPEED = 200.0
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	if mover == true:
		if velocity.x == 0 and velocity.y == 0:
			$idle.visible = true
			$kris_sprites.visible = false
		if Input.is_action_pressed('ui_up'):
			velocity.y = -1*SPEED
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
			$kris_sprites.play("andadno_cima")
		if Input.is_action_pressed('ui_down'):
			velocity.y = SPEED
			$kris_sprites.play("default")
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
		if Input.is_action_pressed('ui_right'):
			velocity.x = SPEED
			$kris_sprites.play("andando_lado")
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
		if Input.is_action_pressed('ui_left'):
			velocity.x = -1*SPEED
			$kris_sprites.play("andando_lado")
			$kris_sprites.flip_h = true
			$idle.visible = false
			$kris_sprites.visible = true
	move_and_slide()
