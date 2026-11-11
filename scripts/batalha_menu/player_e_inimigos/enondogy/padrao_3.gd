extends Node2D

var comecar:bool
var terminar:bool
var conecta:bool
var troca = false
var mini_foice = preload("res://cenas/batalha/Inimigos/foice.tscn")

func dar_dano(valor):
	ScriptsGlobais.kris_status['vida'] -= valor
	SingnalManager.dano.emit()
	return

func comecar_batalha():
	comecar = true
	visible = true
	$foice1.visible = true
	$foice1.monitorable = true
	$foice1.monitoring = true
	$foice2.monitorable = true
	$foice2.monitoring = true
	$foice2.visible = true
	return

func terminar_batalha():
	terminar = true
	hide()
	$foice1.hide()
	$foice1.monitorable = false
	$foice1.monitoring = false
	$foice2.monitorable = false
	$foice2.monitoring = false
	$foice2.hide()
	return
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".turno == 3 and conecta == true:
		conecta = false
		SingnalManager.batalha_comeca.connect(comecar_batalha)
		SingnalManager.batalha_termina.connect(terminar_batalha)
	if $"..".turno != 3:
		conecta = true
	if $"..".turno == 3:
		if comecar == true:
			comecar = false
			$anim_foice1.play("foice")
			$Timer.start()
			$Timer2.start()
		if terminar == true:
			terminar = false
			$Timer.stop()
			$Timer2.stop()


func _on_foice_1_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		print('dano')
		dar_dano(3)
		print('foice1')


func _on_foice_2_body_entered(body: Node2D) -> void:
	if body.is_in_group('alma'):
		print('dano')
		dar_dano(3)
		print('foice2')


func _on_timer_timeout() -> void:
	if troca == true:
		troca = false
		$anim_foice1.play("foice")
	elif troca == false:
		troca = true
		$anim_foice2.play("foice2")


func _on_timer_2_timeout() -> void:
	var foice = mini_foice.instantiate()
	foice.position.x = 185
	$telegraph.visible = true
	await get_tree().create_timer(0.1).timeout
	$telegraph/telegrafo2.visible = true
	await get_tree().create_timer(0.1).timeout
	$telegraph/telegrafo2.visible = false
	await get_tree().create_timer(0.1).timeout
	$telegraph/telegrafo2.visible = true
	await get_tree().create_timer(0.1).timeout
	$telegraph/telegrafo2.visible = false
	$telegraph.hide()
	add_child(foice)
	await get_tree().create_timer(0.3).timeout
	$SndScytheburst.play()
