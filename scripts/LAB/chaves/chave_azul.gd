extends Node2D

@onready var dialogo = $"../../kris/CanvasLayer/text_box"
var papel:bool
@export var chave:bool

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.chaves['azul'] == false or ScriptsGlobais.luzes['azul'] == false:
		if papel == true and Input.is_action_just_pressed('interagir') and dialogo.fim_dial == true:
			papel = false
			$Papel.hide()
			$Papel/interact.monitorable = false
			$Papel/interact.monitoring = false
			$chave/interact_chave.monitorable = true
			$chave/interact_chave.monitoring = true
			dialogo.fim_dial = false
		if chave == true and Input.is_action_just_pressed('interagir') and dialogo.fim_dial == true:
			chave = false
			$chave/interact_chave.monitorable = false
			$chave/interact_chave.monitoring = false
			$chave.hide()
			$"../../sfx/SndItem".play()
	else:
		$Papel.hide()
		$chave.hide()
		$Papel/interact.monitorable = false
		$Papel/interact.monitoring = false
		$chave/interact_chave.monitorable = false
		$chave/interact_chave.monitoring = false


func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Você pegou o papel. Nele estava escrito: "Me desculpe"'
		papel = true

func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		papel = false

func _on_interact_chave_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Você pegou a chave azul.'
		chave = true


func _on_interact_chave_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		chave = false
