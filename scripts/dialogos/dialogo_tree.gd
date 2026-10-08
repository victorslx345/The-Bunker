extends Node2D

func texto(text: String):
	$"../kris/CanvasLayer/text_box".can_play = true
	$"../kris/CanvasLayer/text_box".texto = text

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_arvore_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = true
		$"../kris/CanvasLayer/text_box".texto = 'Ele está atras da arvore.'
		if Input.is_action_just_pressed("interagir"):
			$"../kris".mover = false


func _on_arvore_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = false


func _on_man_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		texto('Tem um homem aqui. Ele esta te entregando algo...')
		if Input.is_action_just_pressed("interagir"):
			texto('Voce recebeu ovo')
			if Input.is_action_just_pressed("interagir"):
				$"../kris".mover = false
	


func _on_man_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
