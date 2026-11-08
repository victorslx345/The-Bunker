extends Node2D

var flag: bool
@onready var dialogo = $"../../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.luzes['vermelho'] == true:
		$cores.play("vermelho")
	else:
		$cores.play("vermelho_d")
	if flag == true and Input.is_action_just_pressed('interagir'):
		if ScriptsGlobais.chaves['vermelho'] == true and ScriptsGlobais.luzes['vermelho'] == false:
			ScriptsGlobais.luzes['vermelho'] = true
			ScriptsGlobais.pegou_chave['vermelho'] = true
			dialogo.texto = 'Você colocou a chave vermelha.'
		elif ScriptsGlobais.chaves['vermelho'] == true and ScriptsGlobais.luzes['vermelho'] == true:
			dialogo.texto = 'A maquina foi ligada.'
		elif ScriptsGlobais.chaves['vermelho'] == false and ScriptsGlobais.luzes['vermelho'] == false:
			dialogo.texto = 'Na maquina tem um buraco, e no buraco tem uma fechadura de cor vermelha.'


func _on_interacao_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true
		dialogo.can_play = true


func _on_interacao_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		flag = false
