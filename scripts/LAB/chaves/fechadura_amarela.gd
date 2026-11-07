extends Node2D

var flag: bool
@onready var dialogo = $"../../../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.luzes['amarelo'] == true:
		$cores.play("amarelo")
	else:
		$cores.play("amarelo_d")
	if flag == true and Input.is_action_just_pressed('interagir'):
		if ScriptsGlobais.chaves['amarelo'] == true:
			ScriptsGlobais.luzes['amarelo'] = true
			ScriptsGlobais.pegou_chave['amarelo'] = true
			dialogo.texto = 'Você colocou a chave amarela.'
		elif ScriptsGlobais.chaves['amarelo'] == false and ScriptsGlobais.luzes['amarelo'] == true:
			dialogo.texto = 'A maquina foi ligada.'
		elif ScriptsGlobais.chaves['amarelo'] == false and ScriptsGlobais.luzes['amarelo'] == false:
			dialogo.texto = 'Na maquina tem um buraco, e no buraco tem uma fechadura de cor amarela.'


func _on_interagivel_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true
		dialogo.can_play = true


func _on_interagivel_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		flag = false
