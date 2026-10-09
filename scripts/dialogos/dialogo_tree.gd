extends Node2D

var man : bool
var ovo = false
func texto(text: String, Mais_Dialogos: bool):
	$"../kris/CanvasLayer/text_box".texto = text
	$"../kris/CanvasLayer/text_box".mais_dia = Mais_Dialogos

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if $"../kris/CanvasLayer/text_box".indice >= 1 and man == true and ovo == false:
			$"../kris/CanvasLayer/text_box".texto = 'Voce recebeu o ovo.'
			if $"../kris/CanvasLayer/text_box".can_play == true and ovo == false and $"../kris/CanvasLayer/text_box".indice == 2 and Input.is_action_just_pressed("interagir"):
				$"../kris/egg".play()
				$man/hitbox.disabled = false
				man = false
				ovo = true
	if $"../kris/CanvasLayer/text_box".indice >= 1 and man == false and ovo == true:
			$"../kris/CanvasLayer/text_box".texto = 'Bem..., não tem um homem aqui.'
	print($"../kris/CanvasLayer/text_box".indice)


func _on_arvore_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = true
		$"../kris/CanvasLayer/text_box".indice = 0
		$"../kris/CanvasLayer/text_box".texto = 'Ele está atras da arvore.'



func _on_arvore_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = false
		$"../kris/CanvasLayer/text_box".indice = 0


func _on_man_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = true
		man = true
		if $"../kris/CanvasLayer/text_box".indice == 0 and ovo == false:
			$"../kris/CanvasLayer/text_box".texto = 'Bem, tem um homem aqui. Ele esta te entregando algo...'
		if $"../kris/CanvasLayer/text_box".indice == 0 and ovo == true:
			$"../kris/CanvasLayer/text_box".texto = 'Bem..., não tem um homem aqui.'


func _on_man_body_exited(body: Node2D) -> void:
	man = false
	$"../kris/CanvasLayer/text_box".can_play = false
	$"../kris/CanvasLayer/text_box".indice = 0
