extends Node2D

@onready var dialogo = $"../kris/CanvasLayer/text_box"
var flag: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flag == true:
		if ScriptsGlobais.itens['miojo'] == false and Input.is_action_just_pressed('interagir'):
			dialogo.texto = 'Dentro da geladeira havia um Miojo.\n Voce pegou o miojo'
			ScriptsGlobais.itens['miojo'] = true
			ScriptsGlobais.add_item('miojo')
			$"../sfx/SndItem".play()
			print(ScriptsGlobais.inventario)
		elif ScriptsGlobais.itens['miojo'] == true:
			dialogo.texto = 'A geladeira esta vazia.'


func _on_estante_1_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Tem varios livros velhos aqui, livros sobre anotomia de monstrons.'


func _on_estante_1_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''
		dialogo.fim_dial = false


func _on_estante_2_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Aqui a livros sobre os poderes da alma de um monstro.'


func _on_estante_2_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''
		dialogo.fim_dial = false


func _on_estante_3_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Aqui a alguns livros sobre Almas Humanas e o poder da DETERMINAÇÂO'


func _on_estante_3_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''
		dialogo.fim_dial = false



func _on_geladeira_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		flag = true


func _on_geladeira_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		flag = false
		dialogo.texto = ''
		dialogo.fim_dial = false


func _on_cama_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'A cama esta bem arrumada e limpa.'

func _on_cama_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''
		dialogo.fim_dial = false
