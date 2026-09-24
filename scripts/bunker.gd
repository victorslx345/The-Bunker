extends Node2D

var anim = false
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
		$Bunker/interacao.queue_free()
		$birds.stream_paused = true
		$Bunker/bunker.stream_paused = true
		$Bunker/impact.playing = true
		
		
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	if $kris.position.y != 120 and anim == true:
		$kris.mover = false
		$kris.move_local_y(1)
		$kris/kris_sprites.visible = true
		$kris/idle.visible = false
		$kris/kris_sprites.play("default")
	if $kris.position.y == 120:
		$kris.mover = true
		anim = false
		$cenario/teto.disabled = false


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
		$kris/idle.play("direita")
		troca_cena("res://cenas/breu.tscn")


func _on_anim_body_entered(body: Node2D) -> void:
	anim = true
