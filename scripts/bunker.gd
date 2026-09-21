extends Node2D

var na_area = false
func troca_cena(cena):
	get_tree().change_scene_to_file(cena)
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if na_area and Input.is_action_just_pressed("interagir"):
		print('CLIQUEI')
		$Bunker/bunker_down.play("abrir")
		$Bunker/hitbox.queue_free()
		$Bunker/hitbox2.queue_free()


func _on_interacao_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		na_area = true
		print('entrei')
		
func _on_interacao_body_exited(body: Node2D) -> void:
	if body.name == 'kris':
		na_area = false
		print('sai')


func _on_teleporte_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		troca_cena("res://cenas/breu.tscn")
