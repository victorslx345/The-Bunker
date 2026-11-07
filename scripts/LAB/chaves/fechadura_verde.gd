extends Node2D

var flag: bool
@onready var dialogo = $"../../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ScriptsGlobais.luzes['verde'] == true:
		$cores.play("verde")
	else:
		$cores.play("verde_d")
	if flag == true and Input.is_action_just_pressed('interagir'):
		if ScriptsGlobais.chaves['verde'] == true:
			ScriptsGlobais.luzes['verde'] = true
			ScriptsGlobais.pegou_chave['verde'] = true
			dialogo.texto = 'Você colocou a chave verde.'
		elif ScriptsGlobais.chaves['verde'] == false and ScriptsGlobais.luzes['verde'] == true:
			dialogo.texto = 'A maquina foi ligada.'
		elif ScriptsGlobais.chaves['verde'] == false and ScriptsGlobais.luzes['verde'] == false:
			dialogo.texto = 'Na maquina tem um buraco, e no buraco tem uma fechadura de cor verde.'


func _on_interagivel_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		flag = true


func _on_interagivel_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false
		flag = false
