extends Node2D

@export var fim_dial : bool
@export var texto : String
@export var tempo : float
@export var end = false
@export var can_play : bool
@export var mais_dia = false
@export var indice = 0
signal dialogo_acabo

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed('menu'):
		tempo = 0.0001
	else:
		tempo = 0.04
	if can_play == true and Input.is_action_just_pressed('interagir'):
		$".".visible = true
		SingnalManager.mover.emit()
		can_play = false
		$texto.visible = true
		for i in texto:
			$texto.text += i
			await get_tree().create_timer(tempo).timeout
			$snd_text.play()
			fim_dial = false
		fim_dial = true
		indice += 1
		if mais_dia == false:
			end = true
		else:
			end = false
			can_play = true
		#if mais_dia == true and fim_dial == true and Input.is_action_just_pressed("interagir"):
			#texto = ''
		print('Terminou')
	
	if end == true and Input.is_action_just_pressed("interagir"):
		$".".visible = false
		can_play = true
		print('saiu')
		end = false
		$texto.text = ''
		SingnalManager.mover.emit()
		
