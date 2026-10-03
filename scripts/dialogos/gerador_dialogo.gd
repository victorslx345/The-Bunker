extends Node2D

var na_area : bool



func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_entrada_1_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = true
		$"../kris/CanvasLayer/text_box".texto = 'ENTRADA NUMERO 17: Esse proximo experimento parece muito, muito interessante...'
		if Input.is_action_just_pressed("interagir"):
			$"../kris".mover = false


func _on_entrada_1_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		$"../kris/CanvasLayer/text_box".can_play = false


func _on_text_box_dialogo_acabo() -> void:
	$"../kris".mover = true
