extends CharacterBody2D

var tempo_if = 1
var velocidade = 100
var game_over = false
@export var Controle: bool = true
func i_frame():
	$"../../sfx/SndHurt1C".play()
	collision_layer = 0
	$sprite.play("i_frame")
	await get_tree().create_timer(tempo_if).timeout
	collision_layer = 1
	$sprite.play("default")
	print('foi')
func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	ScriptsGlobais.alma_pos = global_position
	ScriptsGlobais.kris_status['alma_pos_x'] = position.x
	ScriptsGlobais.kris_status['alma_pos_y'] = position.y
	if ScriptsGlobais.kris_status['vida'] <= 0 and game_over == false:
		game_over = true
		SingnalManager.batalha_termina.emit()
		Controle = false
		$"../../sfx/SndBreak1C".play()
		$iframe.play('morte')
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://cenas/batalha/game_over.tscn")
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
func _ready() -> void:
	SingnalManager.dano.connect(i_frame)
