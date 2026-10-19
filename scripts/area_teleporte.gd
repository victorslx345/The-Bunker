extends Area2D

@export var cena : CanvasLayer
@export var Sala: String
@export var JogadorPos: Vector2
@onready var transicao_anim := cena.get_node('anim')

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		transicao_anim.play('fade_out')
		MudarDeSala.ativar = true
		MudarDeSala.JogadorPos = JogadorPos
		ScriptsGlobais.anim = false
		get_tree().call_deferred("change_scene_to_file", Sala)
