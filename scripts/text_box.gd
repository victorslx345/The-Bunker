extends Node2D

@export var texto : String
@export var tempo : float
var end = false
@export var can_play : bool
signal dialogo_acabo

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if can_play == true and Input.is_action_just_pressed('interagir'):
		$".".visible = true
		SingnalManager.mover.emit()
		can_play = false
		for i in texto:
			$texto.text += i
			await get_tree().create_timer(tempo).timeout
			$snd_text.play()
		end = true
		print('Terminou')
	
	if end == true and Input.is_action_just_pressed("interagir"):
		$".".visible = false
		can_play = false
		print('saiu')
		end = false
		$texto.text = ''
		SingnalManager.mover.emit()
		
