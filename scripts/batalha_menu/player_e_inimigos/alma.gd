extends CharacterBody2D


var velocidade = 100
@export var Controle: bool = false

func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	if Controle == true:
		if Input.is_action_pressed('voltar'):
			velocidade = 150
		else:
			velocidade = 250
		if Input.is_action_pressed('ui_up'):
			velocity.y = -1*velocidade
		if Input.is_action_pressed('ui_down'):
			velocity.y = velocidade
		if Input.is_action_pressed('ui_left'):
			velocity.x =-1* velocidade
		if Input.is_action_pressed('ui_right'):
			velocity.x = velocidade
	move_and_slide()
