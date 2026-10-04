extends Area2D


@export var Sala: String
@export var JogadorPos: Vector2

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		MudarDeSala.ativar = true
		MudarDeSala.JogadorPos = JogadorPos
		ScriptsGlobais.anim = false
		get_tree().call_deferred("change_scene_to_file", Sala)
