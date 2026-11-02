extends Node2D
@onready var dialogo = $"../kris/CanvasLayer/text_box"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_entrada_1_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = 'ENTRADA NUMERO 9: Algumas amostras de determinação foram extraidas, e quatro corpos ja chegaram.'
		dialogo.can_play = true

func _on_entrada_2_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = 'ENTRADA NUMERO 10: Tudo esta pronto para começar os experimentos'
		dialogo.can_play = true

func _on_maquina_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = 'Um painel apagado, escrito:\n"DETERMINAÇÂO: 0%\nTEMPERATURA: 20C"'
		dialogo.can_play = true

func _on_entrada_1_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''

func _on_entrada_2_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''

func _on_maquina_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		dialogo.texto = ''
