extends Node2D

@export var texto : String
@export var tempo : float
var end = false

func _ready() -> void:
	for i in texto:
		$texto.text += i
		await get_tree().create_timer(tempo).timeout
		$snd_text.play()
	end = true
	print('Terminou')

func _process(delta: float) -> void:
	if end == true and Input.is_action_just_pressed("interagir"):
		$".".queue_free()
