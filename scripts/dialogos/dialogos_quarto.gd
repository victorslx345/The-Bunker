extends Node2D

var salgadinho:bool
var salgadinho_dial:bool
var dialogo_tv : bool = false
@onready var dialogo = $"../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dialogo_tv == true:
		if Input.is_action_just_pressed("interagir") and dialogo.fim_dial == true:
			dialogo.texto = ' '
			print('apagou')
	if salgadinho == true:
		salgadinho = false
		ScriptsGlobais.add_item('Salgadinho')

func _on_relogio_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'O ponteiro esta parado em 8:10'


func _on_cama_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = 'Uma cama empoeirada'
		dialogo.can_play = true

func _on_relogio_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
		dialogo.can_play = false

func _on_cama_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''



func _on_tv_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo_tv = true
		dialogo.texto = 'Atras da televisão a um pacote de salgadinhos. Voce pegou Salgadinho.'
