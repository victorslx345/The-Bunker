extends CharacterBody2D

var mover = true
const SPEED = 200.0
var anim = false
func _ready() -> void:
	$idle.play("direita")

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

#ANIMAÇAO~INICIAL~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	if position.y != 120 and anim == true:
		mover = false
		move_local_y(1)
		$kris_sprites.visible = true
		$idle.visible = false
		$kris_sprites.play("default")
	if position.y == 120:
		mover = true
		anim = false
		$"../cenario/teto".disabled = false
		
func _on_anim_body_entered(body: Node2D) -> void:
	anim = true
