extends Node2D
@onready var dialogo = $"../kris/CanvasLayer/text_box"
@export var chave:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.chaves['vermelho'] == false:
		if chave == true and Input.is_action_just_pressed('interagir') and dialogo.fim_dial == true:
			chave = false
			ScriptsGlobais.chaves['vermelho'] = true
			$"../sfx/SndItem".play()
	if ScriptsGlobais.chaves['vermelho'] == true:
		$sprite.hide()
		$interact.monitorable = false
		$interact.monitoring = false


func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Você pegou a chave vermelha.'
		chave = true


func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		chave = false
