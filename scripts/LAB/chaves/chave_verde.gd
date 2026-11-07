extends Node2D

@onready var dialogo = $"../kris/CanvasLayer/text_box"
var banheira:bool
@export var chave:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.chaves['verde'] == false:
		if banheira == true and Input.is_action_just_pressed('interagir'):
			banheira = false
			$chave.monitorable = true
			$chave.monitoring = true
			dialogo.fim_dial = false
		if chave == true and Input.is_action_just_pressed('interagir') and dialogo.fim_dial == true:
			chave = false
			$chave.monitorable = false
			$chave.monitoring = false
			hide()
			ScriptsGlobais.chaves['verde'] = true
			$"../sfx/SndItem".play()
	else:
		hide()
		$chave.monitorable = false
		$chave.monitoring = false


func _on_chave_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Você pegou a chave verde.'
		chave = true
func _on_chave_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		chave = false
