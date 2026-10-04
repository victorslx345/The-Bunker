extends Node2D
var flag = false
var anim = true
var cair = false
func _ready() -> void:
	pass



func _process(delta: float) -> void:
	if anim == true:
		$kris.mover = false
		$kris.move_local_x(1)
		$kris/kris_sprites.play("andando_lado")
		$kris/idle.visible = false
		$kris/kris_sprites.visible = true

	if flag == true and Input.is_action_just_pressed("interagir"):
		$cenario/Porta.visible = false
		$cenario/porta.playing = true
		$kris/idle.animation = 'esquerda'
		$kris/idle.frame = 0
		$brilho/brilho_sprite.visible = false
		$brilho/CollisionShape2D.disabled = true
		$brilho.queue_free()
		flag = false
	if cair == true:
		$kris.move_local_y(10)
		



func _on_brilho_body_entered(body: Node2D) -> void:
	if body.name == 'kris':
		flag = true
		print(flag) # Replace with function body.


func _on_timer_timeout() -> void:
	anim = false
	$kris/idle.visible = true
	$kris/kris_sprites.visible = false
	$kris.mover = true
	$kris/idle.play("direita")


func _on_cair_timeout() -> void:
	$kris.mover = false
	$kris/kris_sprites.play("caindo")
	$kris/kris_sprites.flip_h = true
	cair = true
	$cenario/chao.disabled = true
	$kris/fall.play()
	await $kris/fall.finished
	$kris/impacto.play()
	$kris/idle.visible = false
	$troca_cena.start()
	
	


func _on_brilho_body_exited(body: Node2D) -> void:
	flag = false
	print(flag)


func _on_troca_cena_timeout() -> void:
	get_tree().change_scene_to_file("res://cenas/TRUE_LAB/lab_incial.tscn")
