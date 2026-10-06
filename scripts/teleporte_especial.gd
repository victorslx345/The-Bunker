extends Area2D


@export var Sala: String
@export var JogadorPos: Vector2
var fun_value: int


func _on_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		MudarDeSala.ativar = true
		ScriptsGlobais.anim = false
		fun_value = randi_range(1,50)
		if fun_value == 13:
			MudarDeSala.JogadorPos = Vector2(0,0)
			get_tree().call_deferred("change_scene_to_file", "res://cenas/ovo.tscn")
		else:
			MudarDeSala.JogadorPos = JogadorPos
			get_tree().call_deferred("change_scene_to_file", Sala)
		print(fun_value)
