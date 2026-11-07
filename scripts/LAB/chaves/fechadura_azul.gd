extends Node2D

var controle: bool
var flag: bool
@onready var dialogo = $"../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.luzes['azul'] == true:
		$cores.play("azul")
	else:
		$cores.play("azul_d")
	if flag == true and Input.is_action_just_pressed('interagir'):
		if ScriptsGlobais.chaves['azul'] == true:
			dialogo.texto = 'Você colocou a chave azul.'
			ScriptsGlobais.luzes['azul'] = true
			ScriptsGlobais.pegou_chave['azul'] = true
		elif ScriptsGlobais.chaves['azul'] == false and ScriptsGlobais.luzes['amarelo'] == true:
			dialogo.texto = 'A maquina foi ligada.'
		elif ScriptsGlobais.chaves['azul'] == false and ScriptsGlobais.luzes['amarelo'] == false:
			dialogo.texto = 'Na maquina tem um buraco, e no buraco tem uma fechadura de cor azul.'


func _on_fechadura_2_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true
		dialogo.can_play = true



func _on_fechadura_2_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		flag = false
