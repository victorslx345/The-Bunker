extends CharacterBody2D

var mover = true
const SPEED = 300.0
var anim = true
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
			$kris_sprites.play("andadno_cima")
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
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
	
#ANIMAÇAO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	if position.y != 120 and anim == true:
		mover = false
		move_local_y(1)
		$kris_sprites.visible = true
		$idle.visible = false
		$kris_sprites.play("default")
	if position.y == 120:
		$kris_sprites.visible = false
		$idle.visible = true
		mover = true
		anim = false
		$"../cenario/teto".disabled = false
