extends Node2D

var Controle_maca:bool
var racao: bool
@onready var dialogo = $"../kris/CanvasLayer/text_box"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if racao == true:
		if ScriptsGlobais.itens['ração'] == false and Input.is_action_just_pressed('interagir'):
			dialogo.texto = 'Dentro do armario ha um pacote de ração. Voce pegou Ração.'
			ScriptsGlobais.itens['ração'] = true
			ScriptsGlobais.add_item('ração')
			$"../sfx/SndItem".play()
			print(ScriptsGlobais.inventario)
		elif ScriptsGlobais.itens['ração'] == true:
			dialogo.texto = 'No armario ha apenas um saco vazio.'


func _on_maca_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Em cima da maca tem algum fluido estranho. Você decide não tocar.'


func _on_maca_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''


func _on_entrada_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'ENTRADA NUMERO 11:\n O experimentou deu muito errado.'


func _on_entrada_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''

func _on_armario_1_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		racao = true


func _on_armario_1_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		racao = false
		dialogo.texto = ''


func _on_armario_2_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Dentro do armario ha apenas equipamentos medicos.'


func _on_armario_2_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''


func _on_estante_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = true
		dialogo.texto = 'Os livros estão muito sujos para conseguir ler a capa.'

func _on_estante_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.can_play = false
		dialogo.texto = ''


func _on_maca_chave_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_maca_chave_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
