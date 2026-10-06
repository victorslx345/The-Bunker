extends CharacterBody2D

@export var mover = true
@export var velocidade = 200.0
@export var darkworld = false

func pode_mover():
	if mover == true:
		mover = false
	else:
		mover = true

func _ready() -> void:
	SingnalManager.mover.connect(pode_mover)
	if MudarDeSala.ativar:
		global_position = MudarDeSala.JogadorPos
	MudarDeSala.ativar = false

func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("voltar"):
		velocidade = 270
	else:
		velocidade = 200
	if mover == true and darkworld == false:
		$darkworld.visible = false
		$darkworld_idle.visible = false
		
		if velocity.x == 0 and velocity.y == 0:
			$idle.visible = true
			$kris_sprites.visible = false
		if Input.is_action_pressed('ui_up'):
			velocity.y = -1*velocidade
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
			$kris_sprites.play("andadno_cima")
		elif Input.is_action_pressed('ui_down'):
			velocity.y = velocidade
			$kris_sprites.play("default")
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
		elif Input.is_action_pressed('ui_right'):
			velocity.x = velocidade
			$kris_sprites.play("andando_lado")
			$kris_sprites.flip_h = false
			$idle.visible = false
			$kris_sprites.visible = true
		elif Input.is_action_pressed('ui_left'):
			velocity.x = -1*velocidade
			$kris_sprites.play("andando_lado")
			$kris_sprites.flip_h = true
			$idle.visible = false
			$kris_sprites.visible = true
			
			
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	if mover == true and darkworld == true:
		$kris_sprites.visible = false
		$idle.visible = false
		
		if velocity.x == 0 and velocity.y == 0:
			$darkworld_idle.visible = true
			$darkworld.visible = false
		if Input.is_action_pressed('ui_up'):
			velocity.y = -1*velocidade
			$darkworld.flip_h = false
			$darkworld_idle.visible = false
			$darkworld.visible = true
			$darkworld.play("up")
		elif Input.is_action_pressed('ui_down'):
			velocity.y = velocidade
			$darkworld.play("default")
			$darkworld.flip_h = false
			$darkworld_idle.visible = false
			$darkworld.visible = true
		elif Input.is_action_pressed('ui_right'):
			velocity.x = velocidade
			$darkworld.play("right")
			$darkworld.flip_h = false
			$darkworld_idle.visible = false
			$darkworld.visible = true
		elif Input.is_action_pressed('ui_left'):
			velocity.x = -1*velocidade
			$darkworld.play("left")
			$darkworld.flip_h = false
			$darkworld_idle.visible = false
			$darkworld.visible = true
	move_and_slide()
